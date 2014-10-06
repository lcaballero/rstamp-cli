config = require('../config')
colors = config.colors()

module.exports =
  class ListCommand
    blockIndent : (text, max=70, indent='   ') ->
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


    run : (h) ->

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
        console.log(colors.desc(@blockIndent(desc.summary)))

      console.log()

