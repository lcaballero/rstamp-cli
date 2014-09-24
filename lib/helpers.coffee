_     = require 'lodash'
fs    = require 'fs'
path  = require 'path'

module.exports = (npm) ->
  class Helpers
    constructor: (npm) ->
      @npm = npm
      @globalDir = npm.globalDir
      @cacheDir = npm.cache

    rstamps: () ->
      packages = fs.readdirSync(@npm.globalDir)
      _.filter(_.filter(packages, (p) -> /^rstamp-/.test(p)), (name) -> name isnt 'rstamp-cli')

    descriptions: () ->
      ts = _.map(@rstamps(), (name) => {
        name: name
        path: path.resolve(@npm.globalDir, name)
        json: @readDescription(@npm.globalDir, name)
      })

    readDescription: (dir, name) ->
      moduleDir = path.resolve(dir, name)
      require(path.resolve(moduleDir, 'rstamp.coffee'))


  return new Helpers(npm)