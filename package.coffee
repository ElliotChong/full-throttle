config =
	name: "full-throttle"

	main: main = "dist/index.js"

	license: "Copyright Elliot Chong 2015+"

	version: "0.1.0"

	description: ""

	scripts:
		"package-json": "npm run compile:package-json --silent"
		"package-json:watch": "npm run compile:package-json:watch --silent"
		"compile:package-json": "coffee package.coffee > package.json"
		"compile:package-json:watch": "chokidar 'package.coffee' --command 'npm run compile:package-json --silent' --initial --throttle 1000"

		"compile": "coffee -p src/index.coffee > #{main}"

	keywords: []

	author: [
		"Elliot Chong <code+full-throttle@elliotjameschong.com>"
	]

	contributors: []

	devDependencies:
		"chokidar-cli": "^1.1.1"
		"coffee-script": "^1.10.0"

console.log JSON.stringify config, null, 4
