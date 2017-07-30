// Speaker.js
var mongoose = require('mongoose');
var TalkSchema = new mongoose.Schema({
  name: String,
  description: String,
  speaker: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'Speaker'
    }
});
mongoose.model('Talk', TalkSchema);
module.exports = mongoose.model('Talk');
