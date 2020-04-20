const os = require('os');
const util = require('util');
const http = require('http');

const hostname = '0.0.0.0';
const port = 80;

const getCurrenTime = () => {

	const currentTime = new Date();

	return currentTime.toISOString();
}

const getHostname = () => {

	const hostname = os.hostname();

	if (!hostname) {
		return "<span style=\"color:red\">there is an error</span>";
	} else {
		return hostname;
	}
}

const getText = () => {

	const currentTime = getCurrenTime();
	const hostname = getHostname();

	let text = "<h1>Node</h1><p>Time: %s</p><p>Hostname: %s</p>";

	text = util.format(text, currentTime, hostname);

	return text;
}

const server = http.createServer((req, res) => {

  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/html; charset=utf-8');

  res.end(getText());
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});