'use strict';

const IS_OFFLINE = process.env.IS_OFFLINE;
const DYNAMODB_URL = process.env.DYNAMODB_URL;

import AWS from 'aws-sdk';

const dynamoDbClient = () => {

  let dynamoDbClient;
  if (IS_OFFLINE === 'true') {
    dynamoDbClient = new AWS.DynamoDB.DocumentClient({
      region: 'localhost',
      endpoint: DYNAMODB_URL,
      accessKeyId: 'DEFAULT_ACCESS_KEY',  // needed if you don't have aws credentials at all in env
      secretAccessKey: 'DEFAULT_SECRET' // needed if you don't have aws credentials at all in env
    });
  } else {
    dynamoDbClient = new AWS.DynamoDB.DocumentClient();
  }

  return dynamoDbClient;
}

export const client = () => {

  return dynamoDbClient();
}