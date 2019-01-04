# Backer

Backs up Route53 Records to S3 Bucket.

## Usage

    git clone https://github.com/tongueroo/jets-backup-route53
    cd jets-backup-route53
    bundle
    echo "S3_BUCKET=my-s3-bucket" > .env
    jets deploy

## To test locally

    $ jets console
    >> BackupJob.perform_now(:route53_records)

## Resources

* Blog Post:

If you find Jets interesting, please it a GitHub star <a href="https://github.com/tongueroo/jets">tongueroo/jets</a>. It helps others find out about the project.  I'd appreciate it!
