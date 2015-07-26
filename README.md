First, install node.js and npm for your platform.

Then, install Coffeescript, Mocha and Chai:
$ npm install -g coffee-script
$ npm install -g mocha
$ npm install -g chai

Running tests:
$ mocha --compilers coffee:coffee-script
