'use strict';

import { checkApiKey } from '../security';
import { count } from '../service/count';

export default (event, context, callback) => {
  
  checkApiKey(event, callback);

  const params = {
    TableName: process.env.DYNAMODB_TABLE,
    Select: 'COUNT',
  };

  // fetch all userReview from the database
  count(params, callback);
};