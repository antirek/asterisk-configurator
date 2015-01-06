// Generated by CoffeeScript 1.8.0
(function() {
  var Configurator, Pbx, Trunk;

  Configurator = require('nafnaf').Configurator;

  Trunk = require('./trunk');

  Pbx = (function() {
    function Pbx(dirname) {
      this.trunks = [];
      this.configurator = new Configurator(dirname);
    }

    Pbx.prototype.init = function(callback) {
      return this.configurator.loadFiles(callback);
    };

    Pbx.prototype.addTrunk = function(obj) {
      var trunk;
      trunk = new Trunk(this.configurator, obj);
      trunk.save(function() {
        return console.log('saved');
      });
      return this.trunks.push(trunk);
    };

    return Pbx;

  })();

  module.exports = Pbx;

}).call(this);