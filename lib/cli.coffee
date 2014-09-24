fs      = require 'fs'
npm     = require 'npm'
_       = require 'lodash'
Helpers = require './helpers'
cmd     = require 'commander'
path    = require 'path'
cls     = require 'cli-color'


pkg = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../package.json')))


cmd.version(pkg.version)
  .usage("[option] <file ...>")
  .option('-l, --list', "List the available 'rstamp' templates.")
  .option('-i, --internal', "List the dirs/ and variables used internally by rstamp.")
  .option('-g, --generate', "Generate the project provided as argument to rstamp.")
  .parse(process.argv)

colors =
  name      : cls.xterm(33).underline
  desc      : cls.xterm(41)
  template  : cls.xterm(245)


blockIndent = (text, max=70, indent='   ') ->
  words = text.trim().split(/[ \t\n]/g)
  txt   = [ indent ]
  width = indent.length

  for w in words
    nextWidth = width + w.length

    if nextWidth > max
      txt.push('\n')
      txt.push(indent)
      width = indent.length

    txt.push(w)
    txt.push(' ')

    width += w.length + 1

  txt.join("")


runList = (h) ->

  descriptions    = h.descriptions()
  indent = '   '

  console.log(('-' for n in [1..70]).join(''))
  console.log()
  console.log("Local 'rstamp' templates. Run with:")
  console.log()
  console.log(colors.template("#{indent}%> rstamp -g", "template-name"))
  console.log()
  console.log(('-' for n in [1..70]).join(''))

  for v in descriptions
    desc = v.json
    console.log()
    console.log(colors.name(desc.name))
    console.log()
    console.log(colors.desc(blockIndent(desc.summary)))

  console.log()


runInternal = (h) ->
  console.log({
    globalDir : h.globalDir
    cacheDIr  : h.cacheDir
  })

runGenerate = (h, cmd) ->
  cmd       ?= {}
  cmd.args  = cmd.args or []

  if cmd.args.length < 1
    console.log("Template name is required.")
  else
    rstamps = h.descriptions()
    desc = _.first(_.filter(rstamps, (f) ->
      f.name is ('rstamp-' + cmd.args[0])))
    if desc
      require(desc.path)
    else
      console.log("Could not find %j", cmd.args[0])


npm.load((err, npm) ->

  h = new Helpers(npm)

  if cmd.internal?
    runInternal(h, cmd)

  else if cmd.list?
    runList(h, cmd)

  else if cmd.generate
    runGenerate(h, cmd)

  else
    cmd.outputHelp()
)
