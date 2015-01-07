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

  getTrunks: () ->
    @trunks

  loadTrunks: (callback)->
    result = {}
    object = @configurator.files['users.conf']
    for key of object
      if object.hasOwnProperty(key) and key.substr(0, 6) is 'trunk_'
        result[key] = object[key]

    callback result
      


module.exports = Pbx