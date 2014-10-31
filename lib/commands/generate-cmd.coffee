_     = require('lodash')
conf  = require('../config')
path  = require('path')


module.exports =
  class GenerateCommand
    run : (h, cmd) ->
      cmd       ?= {}
      cmd.args  = cmd.args or []

      if cmd.args.length < 1
        console.log("Template name is required.")
      else
        rstamps = h.descriptions()
        desc    = _.first(_.filter(rstamps, (f) -> f.name is ('rstamp-' + cmd.args[0])))

        if desc
          try
            require(desc.path)(conf.currentConfig())
          catch ex
            throw new Error("Attempting to look-up #{desc.path} (name: #{name}). " + ex.message)
        else
          console.log("Could not find %j", cmd.args[0])

