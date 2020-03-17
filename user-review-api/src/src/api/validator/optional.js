'use strict';

export const dataAutoMoto = (data, callback, params) => {

  if(data.family === 'auto' || data.family === 'moto') {
    if (
      typeof data.version !== 'string'
      || !Array.isArray(data.comment_liked)
      || !Array.isArray(data.comment_disliked)
    ) {
      console.error('Validation Failed');
      callback(null, {
        statusCode: 400,
        headers: { 'Content-Type': 'text/plain' },
        body: 'Couldn\'t create the userReview item. Validation Failed.',
      });
      return;
    }

    params.Item.version = data.version;
    // array
    params.Item.comment_liked = data.comment_liked;
    // array
    params.Item.comment_disliked = data.comment_disliked;
  }
}

export const dataAuto = (data, callback, params) => {

  if(data.family === 'auto') {
    // validation
    if (
      !Number.isInteger(data.conso_moyenne)
      || !Array.isArray(data.entretien)
      || typeof data.comment_problem !== 'string'
    ) {
      console.error('Validation Failed');
      callback(null, {
        statusCode: 400,
        headers: { 'Content-Type': 'text/plain' },
        body: 'Couldn\'t create the userReview item. Validation Failed.',
      });
      return;
    }
    
    params.Item.conso_moyenne = data.conso_moyenne;
    // array
    params.Item.entretien = data.entretien;

    params.Item.comment_problem = data.comment_problem;
  }
}