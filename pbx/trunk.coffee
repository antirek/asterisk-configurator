
class Trunk  

  constructor: (configurator, obj) ->
    @configurator = configurator
    Template = configurator.template
    @user = Template['users'] '__user', obj
    @setName @user.getName()


  save: (callback) ->
    @_appendContextForTrunk () ->
      console.log 'trunk'
    @_appendObjectToUsersConf callback


  setName: (name) ->
    @name = 'trunk_' + name


  _appendObjectToUsersConf: (callback) ->
    users_conf = @configurator.files['users.conf']
    users_conf[@name] = @user.getAttributes()

    @configurator.saveFile 'users.conf', callback
  

  _appendContextForTrunk: (callback) ->
    extensions_conf = @configurator.files['extensions.conf']
    D = @configurator.dialplan
    App = D.Application
    context = new D.Context @name

    context
      .append [
        new D.Extension('s')
          .append(App.Dial('SIP/gate')),
        new D.Include('international_calls')
        ]

    extensions_conf[@name] = context.makeObject()
  
    @configurator.saveFile 'extensions.conf', callback


module.exports = Trunk