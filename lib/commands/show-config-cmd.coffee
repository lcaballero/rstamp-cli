config = require('../config')
colors = config.colors()


module.exports =
  class ShowConfigCommand
    run: (help, cmd) ->
      conf = config.currentConfig()

      for val of conf
        console.log(colors.name(val), colors.desc(conf[val]))

      console.log()
      console.log('To change any of the configuration values run:')
      console.log('%> rstamp --rstamprc')
      console.log()