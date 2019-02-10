Notes and code for Cakefile (and possibly bin/cake) refactor and enhancement.

# Dependency injection

I'm learning!

    module.exports = ({env: NODE_DISABLE_COLORS} = process) ->

# Unrelated cruft in Cakefile

## Output formatting

      ANSI = require 'ansi'

      bold = red = green = yellow = reset = ''
      unless NODE_DISABLE_COLORS
        bold   = SGR mode.bold
        red    = '\x1B[0;31m'
        green  = '\x1B[0;32m'
        yellow = '\x1B[0;33m'
        reset  = '\x1B[0m'


