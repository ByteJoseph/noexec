const fs = require("fs");
const path = require("path");

exports.handler = async function(event, context) {
  const userAgent = event.headers['user-agent'] || "";
  const isCurl = /curl|wget|httpie/i.test(userAgent);

  const filePath = isCurl ? "installer.sh" : "index.html";
  const contentType = isCurl ? "text/x-sh" : "text/html";

  try {
    const fileData = fs.readFileSync(path.resolve(__dirname,"../docs", filePath), "utf8");
    return {
      statusCode: 200,
      headers: {
        "Content-Type": contentType,
      },
      body: fileData
    };
  } catch (err) {
    return {
      statusCode: 500,
      body: "Internal Server Error"
    };
  }
};

