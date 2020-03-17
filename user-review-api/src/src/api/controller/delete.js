'use strict';

import { checkApiKey } from '../security';
import { remove } from '../service/delete';

export default (event, context, callback) => {
  
  checkApiKey(event, callback);

  const params = {
    TableName: process.env.DYNAMODB_TABLE,
    Key: {
      id: event.pathParameters.id,
    },
    ExpressionAttributeNames: {
      '#i': 'id',
    },
    ConditionExpression: 'attribute_exists(#i)',
  };

  // delete the userReview from the database
  remove(params, callback);
};