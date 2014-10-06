fs    = require('fs')
path  = require('path')
qu    = require('inquirer')
_     = require('lodash')
config = require('../config')


questions = (conf) ->
  conf ?= {}
  [
    {
      name    : "username"
      type    : "input"
      message : "What username to use during generation of project (like new-npm)?"
      default : process.env.USER
    }
    {
      name    : "email"
      type    : "input"
      message : "What email would you like to default to?"
      default : conf.email
    }
    {
      name    : "repoPrefix"
      type    : "input"
      message : "For commands that create request a repository what prefix would you like to use?"
      default : conf.repoPrefix
    }
    {
      name    : "license"
      type    : "input"
      message : "What license would you like to use a default?"
      default : conf.license
    }
  ]


module.exports =
  class CreateResourceCommand
    run: ->
      conf = config.currentConfig()
      qu.prompt(questions(conf), (answers) ->
        full = _.defaults({}, answers, conf)
        json = JSON.stringify(full, null, '  ')

        fs.writeFileSync(config.resourceFile(), json)
      )



