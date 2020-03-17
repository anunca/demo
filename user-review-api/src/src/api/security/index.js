'use sctrict';

const getHeaders = (headers) => {

  let headersString = JSON.stringify(headers);
  headersString = headersString.replace(/-/g, '');

  const headersObject = JSON.parse(headersString);

  return headersObject;
}

export const checkApiKey = (event, callback) => {
  return;
  const headers = getHeaders(event.headers);

  const clientSource = headers.XClientSource;
  const apiKey = headers.XApiKey;

  if (!clientSource || !process.env.WS_USER_REVIEW_DESKTOP_X_CLIENT_SOURCE.includes(clientSource)) {

    console.error(`clientSource: ${clientSource}`);

    return callback(null, { statusCode: 401 });
  }

  if (!apiKey || !process.env.WS_USER_REVIEW_DESKTOP_X_API_KEY.includes(apiKey)) {

    console.error(`ApiKey: ${apiKey}`);

    return callback(null, { statusCode: 401 });
  }
}