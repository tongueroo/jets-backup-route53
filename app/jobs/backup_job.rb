require 'aws-sdk-route53'
require 'json'

class BackupJob < ApplicationJob
  iam_policy "s3"
  managed_iam_policy "AmazonRoute53ReadOnlyAccess"
  rate "1 day"
  def route53_records
    puts "Backing up route53 records"

    hosted_zones = route53.list_hosted_zones.hosted_zones
    hosted_zones.each do |zone|
      page, start_record_name, start_record_type = 1, :kickoff, :kickoff
      while start_record_name
        options = { hosted_zone_id: zone.id }
        if start_record_name && start_record_name != :kickoff
          options[:start_record_name] = start_record_name
          options[:start_record_type] = start_record_type
        end

        resp = route53.list_resource_record_sets(options)

        domain = zone.name.chop # remove trailing period
        save_to_s3("backups/route53/#{domain}-#{page}.json", resp)

        start_record_name = resp.next_record_name
        start_record_type = resp.next_record_type
        page += 1
      end
    end

    {success: true}
  end

private
  def save_to_s3(key, resp)
    data = JSON.pretty_generate(resp.to_h)
    puts("Saving to s3://#{bucket_name}/#{key}")
    s3.put_object(
      bucket: bucket_name,
      key: key,
      body: data,
    )
  end

  def bucket_name
    ENV['S3_BUCKET']
  end

  def route53
    @route53 ||= Aws::Route53::Client.new
  end

  def s3
    @s3 ||= Aws::S3::Client.new
  end
end
