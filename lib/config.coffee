path  = require('path')
fs    = require('fs')
cls   = require('cli-color')

module.exports = do ->
  class Config
    getUserHome   : -> process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE;
    exists        : (file) -> fs.existsSync(file)
    resourceFile  : -> path.resolve(@getUserHome(), '.rstamprc.json')
    currentConfig : ->
      rc = @resourceFile()
      if @exists(rc) then require(rc)
      else {}
    colors : ->
      name      : cls.xterm(33).underline
      desc      : cls.xterm(41)
      template  : cls.xterm(245)

  new Config()