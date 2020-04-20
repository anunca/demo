'use strict';

import { checkApiKey } from '../security';
import * as required from '../validator/required';
import * as optional from '../validator/optional';
import uuid from 'uuid';
import { create } from '../service/create';

export default (event, context, callback) => {
  
  checkApiKey(event, callback);

  const date = new Date().toISOString();
  const data = JSON.parse(event.body);

  // validation
  required.dataAutoMoto(data, callback);

  const id = uuid.v4();

  const params = {
    TableName: process.env.DYNAMODB_TABLE,
    Item: {
      id: id,
      user_id: data.user_id,
      tag_id: data.tag_id,
      millesime: data.millesime,
      possession: data.possession,
      km_per_year: data.km_per_year,
      comment: data.comment,

      family: data.family,
      created_date: date,
      moderated_date: date,
      status: 'UNVALIDATED',
    },
    //TODO check how to stop duplicate post from same user
    // ExpressionAttributeNames: {
    //   '#u': 'user_id',
    //   '#c': 'comment',
    // },
    // ExpressionAttributeValues: {
    //   ':user_id': data.user_id,
    //   ':comment': data.comment,
    // },
    // ConditionExpression: '#u = :user_id AND #c = :comment',
  };

  required.dataAuto(data, callback, params);
  required.dataMoto(data, callback, params);

  optional.dataAutoMoto(data, callback, params);
  optional.dataAuto(data, callback, params);

  // write the userReview to the database
  create(params, callback);
};