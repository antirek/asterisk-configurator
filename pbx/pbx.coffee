Configurator = require('nafnaf').Configurator
Trunk = require('./trunk')

class Pbx

  constructor: (dirname) ->
    @trunks = []
    @configurator = new Configurator dirname

  init: (callback) ->
    @configurator.loadFiles callback

  addTrunk: (obj) ->
    trunk = new Trunk @configurator, obj
    trunk.save ()->
      console.log 'saved'
    @trunks.push trunk


module.exports = Pbx