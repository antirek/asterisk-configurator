var express = require('express');
var router = express.Router();


/* GET users listing. */
router.get('/', function(req, res) {
  var p = req.pbx.configurator.files['sip.conf'].general;
  console.log(p);
  res.send(p);
});


router.get('/addTrunk', function(req, res){
  var obj = {name: 'Vasya1', secret: '1234', hassip: 'yes', lopata: '12'};
  req.pbx.addTrunk(obj);
  res.send(obj);
});


module.exports = router;
