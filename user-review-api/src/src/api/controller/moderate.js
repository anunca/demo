'use strict';

import { checkApiKey } from '../security';
import { status } from '../validator/status';
import { moderate as moderateService } from '../service/moderate';

export default (event, context, callback) => {
  
  checkApiKey(event, callback);

  const date = new Date().toISOString();
  const data = JSON.parse(event.body);

  //TODO a better validation
  // validation
  if (typeof data.status !== 'string') {
    console.error('Validation Failed');
    callback(null, {
      statusCode: 400,
      headers: { 'Content-Type': 'text/plain' },
      body: 'Couldn\'t update the userReview item. Validation Failed.',
    });
    return;
  }

  if (status.includes(data.status) !== true) {
    console.error('Validation Failed');
    callback(null, {
      statusCode: 400,
      headers: { 'Content-Type': 'text/plain' },
      body: `Couldn't moderate the userReview item. Validation Failed. Status: ${data.status} is not valid`,
    });
    return;
  }

  const params = {
    TableName: process.env.DYNAMODB_TABLE,
    Key: {
      id: event.pathParameters.id,
    },
    ExpressionAttributeNames: {
      '#s': 'status',
    },
    ExpressionAttributeValues: {
      ':status': data.status,
      ':moderated_date': date,
    },
    ConditionExpression: 'attribute_exists(id)',
    UpdateExpression: 'SET #s = :status, moderated_date = :moderated_date',
    ReturnValues: 'UPDATED_NEW',
  };

  // update the userReview in the database
  moderateService(params, callback);
};