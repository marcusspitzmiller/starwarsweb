console.log("Starting...");
var http = require('http');

http.createServer(function (req, res) {
  console.log("Running..");
  res.write('The empire did nothing wrong.'); //write a response to the client
  res.end(); //end the response
}).listen(8080); //the server object listens on port 8080
