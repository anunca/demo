# user-review-api

## Overview
+ Dependencies
+ Install
  - Using yarn
+ Usage
  - Serverless
+ Reference

## Dependencies
* nodejs
* serverless

## Install

### Using yarn
```bash
#install serverless
yarn global add serverless

#add servelesss path
#
export PATH="$(yarn global bin):$PATH"
#
cat >> ~/.bashrc <<EOF
export PATH="$(yarn global bin):$PATH"
EOF

#install project dependencies
yarn install
```

## Usage

### Serverless

#### check serverless file
```bash
yarn sls:print:dev
```

## Reference
* [nodejs][0]
* [serverless][1]
* serverless AWS cli reference [AWS cli reference][2]

[0]: https://nodejs.org/en/download/
[1]: https://serverless.com/framework/docs/providers/aws/guide/installation/
[2]: https://serverless.com/framework/docs/providers/aws/cli-reference/