'use strict';

import { checkApiKey } from '../security';
import { get } from '../service/get';

export default (event, context, callback) => {

  checkApiKey(event, callback);
  
  const params = {
    TableName: process.env.DYNAMODB_TABLE,
    Key: {
      id: event.pathParameters.id,
    },
    // ExpressionAttributeNames: {
    //   '#c': 'comment'
    // },
    // ProjectionExpression: '#c',
  };

  // fetch userReview from the database
  get(params, callback);
};