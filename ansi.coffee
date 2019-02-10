codes =
  reset:  0
  bold:   1
  red:    31
  green:  32
  yellow: 33

sgr = (fmts...) ->
  "\x1B[#{[codes.reset, fmts...].join ';'}m"

module.exports[name] = sgr codes[name]
module.exports.reset = sgr()

  ###
  # ANSI Terminal Colors. See
  # https://en.wikipedia.org/wiki/ANSI_escape_code, for example.
  ANSI: ANSI =
    ESC:  ( s)  -> '\x1b' + s.toString()
    CSI:  ( s)  -> ESC '[' s.toString()
    SGR:  ( s)  -> CSI s + 'm'
    SGRl: (ss)  -> SGR ss.join ';'

    mode: Object.assign ( (m) -> (s) -> SGRl(m) + s),
      reset: '0'
      bold:  '1'

    color:
      Object.assign ( (color) -> (s) -> SGRl(normalize color) + s
        (nameOrNumber) ->
          if 'number' is typeof colorNumber = @color.values[nameOrNumber]
            colorNumber
          else if 0 <= colorNumber = parseInt nameOrNumber < 8
            colorNumber
          else
            throw new Error "Unknown color '#{nameOrNumber}'"
        ),
      names:  names = '''black red green yellow blue magenta cyan white'''.match /\D+/g
      values: Object.assign ( [name]: i for name, i in names )...
      fore: (color) ->
        if color in names
          color = values[name]
        "3#{color}"
  ###
