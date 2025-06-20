const fs = require("fs");
const path = require("path");

exports.handler = async function (event, context) {
  console.log('=== DEBUG INFO ===');
  console.log('HTTP Method:', event.httpMethod);
  console.log('All Headers:', JSON.stringify(event.headers, null, 2));
  console.log('Raw User-Agent:', event.headers["user-agent"]);
  console.log('==================');
  
  const userAgent = (event.headers["user-agent"] || "").toLowerCase();
  console.log('Processed User-Agent:', userAgent);
  
  const isCurl = userAgent.includes('curl') || 
                 userAgent.includes('wget') || 
                 userAgent.includes('httpie') ||
                 userAgent.includes('fetch') ||
                 userAgent.startsWith('curl/');
  
  console.log('Is Curl detected:', isCurl);
  
  const fileName = isCurl ? "installer.sh" : "index.html";
  const filePath = path.resolve(__dirname, "../docs", fileName);
  const contentType = isCurl ? "text/plain; charset=utf-8" : "text/html";
  
  console.log('Selected file:', fileName);
  console.log('File path:', filePath);
  
  try {
    const fileData = fs.readFileSync(filePath, "utf8");
    console.log('File read successfully, length:', fileData.length);
    
    return {
      statusCode: 200,
      headers: {
        "Content-Type": contentType,
        "Cache-Control": "no-cache",
      },
      body: fileData,
    };
  } catch (err) {
    console.error('File read error:', err);
    return {
      statusCode: 500,
      headers: {
        "Content-Type": "text/plain",
      },
      body: `Internal Server Error: ${err.message}`,
    };
  }
};
