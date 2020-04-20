'use strict';

export const dataAutoMoto = (data, callback) => {

  if (
    !Number.isInteger(data.user_id)
    || !Number.isInteger(data.tag_id)
    || !Number.isInteger(data.millesime)
    || typeof data.possession !== 'string'
    || !Number.isInteger(data.km_per_year)
    || typeof data.comment !== 'string'
  ) {
    console.error('Validation Failed');
    callback(null, {
      statusCode: 400,
      headers: { 'Content-Type': 'text/plain' },
      body: 'Couldn\'t create the userReview item. Validation Failed.',
    });
    return;
  }
}

export const dataAuto = (data, callback, params) => {

  if(data.family === 'auto') {
    if (
      !Array.isArray(data.type_use)
      || !Array.isArray(data.type_road)
      || typeof data.scores !== 'object'
    ) {
      console.error('Validation Failed');
      callback(null, {
        statusCode: 400,
        headers: { 'Content-Type': 'text/plain' },
        body: 'Couldn\'t create the userReview item. Validation Failed.',
      });
      return;
    }

    // array
    params.Item.type_use = data.type_use;
    // array
    params.Item.type_road = data.type_road;
    // object
    params.Item.scores = data.scores;
  }
}

export const dataMoto = (data, callback, params) => {

  if(data.family === 'moto') {
    if (
      !Array.isArray(data.use)
      || !Array.isArray(data.type_use)
      || typeof data.scores !== 'object'
    ) {
      console.error('Validation Failed');
      callback(null, {
        statusCode: 400,
        headers: { 'Content-Type': 'text/plain' },
        body: 'Couldn\'t create the userReview item. Validation Failed.',
      });
      return;
    }

    // array
    params.Item.use = data.use;
    // array
    params.Item.type_use = data.type_use;
    // object
    params.Item.scores = data.scores;
  }
}