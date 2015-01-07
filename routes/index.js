var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res) {
  res.render('index', { title: 'Express' });
});


router.get('/trunk/list', function(req, res) {

  console.log(req.pbx.configurator.files['users.conf']);

  req.pbx.loadTrunks(function (result) {
    console.log(result);
    res.render('trunk', { title: 'Express' });
  });

});

module.exports = router;
