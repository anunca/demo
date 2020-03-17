# alb

## Overview
+ Dependencies
+ Install
  - Using docker
+ Usage
  - Serverless
+ Reference

## Dependencies
* nodejs
* serverless

## Install

### Using docker
```bash
#usage
make build
make start
```

## Usage

### Serverless

#### set your AWS credentials
```bash
#export
export AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=YOUR_AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=eu-west-1
#cat
sudo bash -c "cat <<EOF > $HOME/.aws/credentials
[default]
aws_access_key_id = $AWS_ACCESS_KEY_ID
aws_secret_access_key = $AWS_SECRET_ACCESS_KEY
region = $AWS_DEFAULT_REGION
EOF"
#serverless
make credential
```

#### check serverless file
```bash
#dev
make project.print
```

## Reference
* [nodejs][0]
* [serverless][1]
* serverless AWS cli reference [AWS cli reference][2]

[0]: https://nodejs.org/en/download/
[1]: https://serverless.com/framework/docs/providers/aws/guide/installation/
[2]: https://serverless.com/framework/docs/providers/aws/cli-reference/