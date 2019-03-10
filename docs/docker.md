# Docker

https://blog.velalu.qa/admin/tech/ruby/rails/docker/2017/11/06/rails-in-docker-on-aws-elastic-beanstalk.html - Based on this. 

Ideally this'll auto deploy once tests past via codeship.

## Building & running

### Build your docker environments

    docker-composer build

### Run rails app

    docker-composer run

### Run one off commands

    docker-composer run web rails c

## Running on Beanstalk

### Registering the container

    aws ecr create-repository --repository-name rails-deploying-app --region eu-west-2 &&
    aws iam attach-role-policy --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly --role-name aws-elasticbeanstalk-ec2-role --region eu-west-2

### Building container and pushing to to ECR

    `aws ecr get-login --no-include-email --region eu-west-2` &&
    docker build -t rails-deploying-app . &&
    docker tag rails-deploying-app:latest 094629777318.dkr.ecr.eu-west-2.amazonaws.com/rails-deploying-app:latest &&
    docker push 094629777318.dkr.ecr.eu-west-2.amazonaws.com/rails-deploying-app:latest
