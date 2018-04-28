Notes and code for Cakefile (and possibly bin/cake) refactor and enhancement.

# Dependency injection

I'm learning!

    module.exports = ({process: env: NODE_DISABLE_COLORS}) ->

# Unrelated cruft in Cakefile

## Output formatting

      # ANSI Terminal Colors. See
      # https://en.wikipedia.org/wiki/ANSI_escape_code, for example.
      ANSI =
        ESC: (s) -> '\x1b' + s.toString()
        CSI: (s) -> ESC '[' + s.toString()
        SGR: (s) -> CSI + s + 'm'
        move: (dir) ->
          dCode = ANSI.moves.dirCode[dir]
          (n) -> CSI n.toString(10) + dCode
        moves:
          up: 'A'
          down: 'B'
          forward: 'C'
          backward: 'D'
        mode:
          bold: '1m'

      bold = red = green = yellow = reset = ''
      unless NODE_DISABLE_COLORS
        bold   = '\x1B[0;1m'
        red    = '\x1B[0;31m'
        green  = '\x1B[0;32m'
        yellow = '\x1B[0;33m'
        reset  = '\x1B[0m'


