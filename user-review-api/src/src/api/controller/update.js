'use strict';

import { checkApiKey } from '../security';
import { update } from '../service/update';

export default (event, context, callback) => {
  
  checkApiKey(event, callback);

  const date = new Date().toISOString();
  const data = JSON.parse(event.body);

  //TODO a better validation
  // validation
  if (typeof data.comment !== 'string') {
    console.error('Validation Failed');
    callback(null, {
      statusCode: 400,
      headers: { 'Content-Type': 'text/plain' },
      body: 'Couldn\'t update the userReview item. Validation Failed.',
    });
    return;
  }

  const params = {
    TableName: process.env.DYNAMODB_TABLE,
    Key: {
      id: event.pathParameters.id,
    },
    ExpressionAttributeNames: {
      '#c': 'comment',
    },
    ExpressionAttributeValues: {
      ':comment': data.comment,
      ':moderated_date': date,
    },
    ConditionExpression: 'attribute_exists(id)',
    UpdateExpression: 'SET #c = :comment, moderated_date = :moderated_date',
    ReturnValues: 'UPDATED_NEW',
  };

  // update the userReview in the database
  update(params, callback);
};