// Speaker.js
var mongoose = require('mongoose');
var TalkSchema = new mongoose.Schema({
  name: String,
  description: String
});
mongoose.model('Talk', TalkSchema);
module.exports = mongoose.model('Talk');
