'use strict';

import * as dynamodb from '../../dynamodb';
const dynamoDb = dynamodb.client();

export const remove = (params, callback) => {

  dynamoDb.delete(params, (error) => {
    // handle potential errors
    if (error) {
      console.error(error);
      callback(null, {
        statusCode: error.statusCode || 501,
        headers: { 'Content-Type': 'text/plain' },
        body: 'Couldn\'t remove the userReview item.',
      });
      return;
    }

    // create a response
    const response = {
      statusCode: 204,
      body: JSON.stringify({}),
    };
    callback(null, response);
  });
}