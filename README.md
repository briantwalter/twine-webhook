twine-webhook
=============

Microservice app written in nodejs that translates HTTP POST actions from Twine.cc sensors's
rulesets and re-POSTs the data in JSON format to a dashing.io dashboard widget.

`app/app.js` NodeJs HTTP microservice that starts with npm start

`harness.sh`  Bash script using cURL to emulate Twine rule POST
