# Backer

[![BoltOps Badge](https://img.boltops.com/boltops/badges/boltops-badge.png)](https://www.boltops.com)

Backs up Route53 Records to S3 Bucket.

![](https://raw.githubusercontent.com/tongueroo/jets-backup-route53/master/screenshots/backer-lambda-console.png)

## Usage

    git clone https://github.com/tongueroo/jets-backup-route53
    cd jets-backup-route53
    bundle
    echo "S3_BUCKET=my-s3-bucket" > .env
    jets deploy

Note, the project name is "backer". To change this adjust [config/application.rb](config/application.rb). More info: [Jets App Configuration](http://rubyonjets.com/docs/app-config/)

## To test locally

    $ jets console
    >> BackupJob.perform_now(:route53_records)

## Resources

* Blog Post: [Serverless Ruby Cron Jobs with Jets: Route53 Backup](https://blog.boltops.com/2019/01/03/serverless-ruby-cron-jobs-with-jets-route53-backup)

If you find Jets interesting, please it a GitHub star <a href="https://github.com/tongueroo/jets">tongueroo/jets</a>. It helps others find out about the project.  I'd appreciate it!
