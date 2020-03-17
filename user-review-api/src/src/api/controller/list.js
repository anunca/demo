'use strict';

import { checkApiKey } from '../security';
import { list } from '../service/list';

export default (event, context, callback) => {
  
  checkApiKey(event, callback);

  const data = event.queryStringParameters;

  const params = {
    TableName: process.env.DYNAMODB_TABLE,
    // KeyConditionExpression: '#i = :id AND #f = :family',
    ExpressionAttributeNames: {
      // '#i': 'id',
      '#f': 'family',
    },
    // ProjectionExpression: '#i, #f',
  };

  if (data) {
    if(data.limit)
    {
      const limit = data.limit;
      params.Limit = limit;
    }
    if(data.family)
    {
      const family = data.family;
      params.FilterExpression = '#f = :family';
      params.ExpressionAttributeValues = {
        ':family': family
      };
    }
  }

  // fetch all userReview from the database
  list(params, callback);
};