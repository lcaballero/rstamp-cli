ListCmd           = require('./list-cmd')
GeneratorCmd      = require('./generate-cmd')
InternalsCmd      = require('./internals-cmd')
CreateResourceCmd = require('./create-resource-cmd')
ShowConfigCmd     = require('./show-config-cmd')

module.exports =
  list        : new ListCmd()
  generate    : new GeneratorCmd()
  internals   : new InternalsCmd()
  rstamprc    : new CreateResourceCmd()
  showConfig  : new ShowConfigCmd()