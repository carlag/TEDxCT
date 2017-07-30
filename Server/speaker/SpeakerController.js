// SpeakerController.js
var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
router.use(bodyParser.urlencoded({ extended: true }));
var Speaker = require('./Speaker');
// ADD THIS PART
// CREATES A NEW TALK
router.post('/', function (req, res) {
    Speaker.create({
            name : req.body.name
        },
        function (err, speaker) {
            if (err) return res.status(500).send("There was a problem adding the information to the database.");
            res.status(200).send(speaker);
        });
});
// RETURNS ALL THE TALKS IN THE DATABASE
router.get('/', function (req, res) {
    Speaker.find({}, function (err, speakers) {
        if (err) return res.status(500).send("There was a problem finding the speakers.");
        res.status(200).send(speakers);
    });
});

// // GETS A SINGLE USER FROM THE DATABASE
// router.get('/:id', function (req, res) {
//     User.findById(req.params.id, function (err, user) {
//         if (err) return res.status(500).send("There was a problem finding the user.");
//         if (!user) return res.status(404).send("No user found.");
//         res.status(200).send(user);
//     });
// });
//
// // DELETES A USER FROM THE DATABASE
// router.delete('/:id', function (req, res) {
//     User.findByIdAndRemove(req.params.id, function (err, user) {
//         if (err) return res.status(500).send("There was a problem deleting the user.");
//         res.status(200).send("User "+ user.name +" was deleted.");
//     });
// });
//
// // UPDATES A SINGLE USER IN THE DATABASE
// router.put('/:id', function (req, res) {
//
//     User.findByIdAndUpdate(req.params.id, req.body, {new: true}, function (err, user) {
//         if (err) return res.status(500).send("There was a problem updating the user.");
//         res.status(200).send(user);
//     });
// });

module.exports = router;
