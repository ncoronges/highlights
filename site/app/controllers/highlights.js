/**
 * Module dependencies.
 */
var mongoose = require('mongoose'),
    Highlight = mongoose.model('Highlight'),
    _ = require('underscore');


/**
 * Show a highlight
 */
exports.show = function(req, res) {
    res.jsonp(req.article);
};

/**
 * List of Highlights
 */
exports.all = function(req, res) {
    Highlight.find().sort('source_id').exec(function(err, highlights) {
        if (err) {
            res.render('error', {
                status: 500
            });
        } else {
            res.jsonp(highlights);
        }
    });
};
