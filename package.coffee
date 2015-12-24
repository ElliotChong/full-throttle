config =
	name: "full-throttle"

	main: main = "dist/index.js"

	license: "Copyright Elliot Chong 2015+"

	version: "0.1.1"

	description: "Throttle a method to the browser's framerate."

	repository:
		type: "git"
		url: "https://github.com/ElliotChong/full-throttle.git"

	scripts:
		"clean": "npm run compile:package-json --silent && npm prune && npm install && npm run test --silent"
		"compile": "coffee --compile --output dist src"

		"clean-compile": "npm run clean --silent && npm run compile --silent"

		"compile:package-json": "coffee package.coffee > package.json"
		"compile:package-json:watch": "chokidar 'package.coffee' --command 'npm run compile:package-json --silent' --initial --throttle 1000"

		"test": "echo 'TODO: Implement tests'"

	keywords: []

	author: [
		"Elliot Chong <code+full-throttle@elliotjameschong.com>"
	]

	contributors: []

	devDependencies:
		"chokidar-cli": "^1.1.1"
		"coffee-script": "^1.10.0"

console.log JSON.stringify config, null, 4
