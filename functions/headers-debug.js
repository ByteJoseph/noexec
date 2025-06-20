exports.handler = async function (event, context) {
  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      method: event.httpMethod,
      headers: event.headers,
      userAgent: event.headers["user-agent"],
      path: event.path,
      queryStringParameters: event.queryStringParameters
    }, null, 2),
  };
};
