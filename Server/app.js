//app.js
var express = require('express');
var app = express();
var db = require('./db')

console.log("setting up user binding")

var UserController = require('./user/UserController');
app.use('/users', UserController);

module.exports = app;
