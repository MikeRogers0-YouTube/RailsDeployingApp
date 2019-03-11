# Deploying to AWS Elastic Beanstalk

## Install AWS CLI && EB CLI

    brew install awscli awsebcli

## Creating App

### With RDS database

Run: 

    eb create --instance_type t2.small -d -db.engine postgres  -db.size 5 --database.instance db.t2.micro --envvars DURING_RELEASE_RUN_MIGRATIONS=enabled,LANG=en_US.UTF-8,RACK_ENV=production,RAILS_ENV=production,RAILS_LOG_TO_STDOUT=enabled,RAILS_SERVE_STATIC_FILES=enabled,SECRET_KEY_BASE=`rake secret`

### When you've got a DB already setup

Run: 

    eb create --instance_type t2.small --envvars DURING_RELEASE_RUN_MIGRATIONS=enabled,LANG=en_US.UTF-8,RACK_ENV=production,RAILS_ENV=production,RAILS_LOG_TO_STDOUT=enabled,RAILS_SERVE_STATIC_FILES=enabled,SECRET_KEY_BASE=`rake secret`,DATABASE_URL=postgres://some-db-url

## Deploying

    eb deploy

    eb create --instance_type t2.small --envvars DURING_RELEASE_RUN_MIGRATIONS=enabled,LANG=en_US.UTF-8,RACK_ENV=production,RAILS_ENV=production,RAILS_LOG_TO_STDOUT=enabled,RAILS_SERVE_STATIC_FILES=enabled,SECRET_KEY_BASE=51406b81a0af523b0498ac168641bfffe2b15713c84895b0496825adc2d0680a8852efd5f40fb07808ab3a6c2e1dce26cde6e8c1882fd2fc5e602555e995bd11,DATABASE_URL=postgres://uyrpzsyqwcvwkw:17463d4cea730e294b1f57dbceaf3e87246f7fdba38fe1950932cfe4f3f9e1bf@ec2-54-75-226-5.eu-west-1.compute.amazonaws.com:5432/datbgecjejlr94,REDIS_URL=redis://h:p57446c1a91201dba1186334dba1e6b9f6b056b0b9c5065ca13a549f500287e79@ec2-63-35-89-186.eu-west-1.compute.amazonaws.com:13079
