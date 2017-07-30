// db.js
var mongoose = require('mongoose');
mongoose.connect('mongodb://carlag:29TA74jRW8F3@ds123193.mlab.com:23193/tedxcapetown', {
  useMongoClient: true,
});
