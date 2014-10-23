fs      = require 'fs'
npm     = require 'npm'
_       = require 'lodash'
Helpers = require './helpers'
cmd     = require 'commander'
path    = require 'path'
cmds    = require './commands/cmds'


pkg = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../package.json')))


cmd.version(pkg.version)
  .usage("[option] <file ...>")
  .option('-l, --list', "List the available 'rstamp' templates.")
  .option('-i, --internal', "List the dirs/ and variables used internally by rstamp.")
  .option('-g, --generate', "Generate the project provided as argument to rstamp.")
  .option('-c, --configuration', "List saved configuation values.")
  .option('-r, --rstamprc', "Generate a .rstamprc.json configuration file.")
  .parse(process.argv)


showValues = (cmd) ->
  flags = ['list', 'internal', 'generate', 'configuration', 'rstamprc']
  for f in flags
    console.log(f, cmd[f])


npm.load((err, npm) ->

  if err? then return console.log(JSON.stringify(err))

  nogen = path.resolve(process.cwd(), ".rstamp.nogen")

  if fs.existsSync(nogen)
    console.log("#{nogen} file is present in target directory.")
    console.log("Aborting generation.")
  else
    h = new Helpers(npm)

    if cmd.internal?          then cmds.internals.run(h, cmd)
    else if cmd.list?         then cmds.list.run(h, cmd)
    else if cmd.generate      then cmds.generate.run(h, cmd)
    else if cmd.rstamprc      then cmds.rstamprc.run(h, cmd)
    else if cmd.configuration then cmds.showConfig.run(h, cmd)
    else cmd.outputHelp()
)
