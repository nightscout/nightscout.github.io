plus = require './plus'
{toPromise} = require './helper-promise'

# JSON Replacer
# ===============================
#
# - Sprinkles methods into the JSON returned from GitHub.
#   - URL templates are converted to methods (like `compare_url`)
#   - If the JSON matches something in OBJECT_MATCHER then additional methods
#     are sprinkled in.
# - Converts keys to `camelCase`

class Replacer
  constructor: (@_request) ->

  uncamelize: (obj) ->
    if Array.isArray(obj)
      return (@uncamelize(i) for i in obj)
    else if obj == Object(obj)
      o = {}
      for key, value of obj
        o[plus.uncamelize(key)] = @uncamelize(value)
      return o
    else
      return obj

  replace: (o) ->
    if Array.isArray(o)
      return @_replaceArray(o)
    else if o == Object(o)
      return @_replaceObject(o)
    else
      return o

  _replaceObject: (orig) ->
    acc = {}
    for key, value of orig
      @_replaceKeyValue(acc, key, value)
    acc

  _replaceArray: (orig) ->
    arr = (@replace(item) for item in orig)
    # Convert the nextPage methods for paged results
    for key, value of orig
      @_replaceKeyValue(arr, key, value) if typeof key is 'string'
    arr

  # Convert things that end in `_url` to methods which return a Promise
  _replaceKeyValue: (acc, key, value) ->
    if /_url$/.test(key)
      fn = (cb, args...) =>
        # url can contain {name} or {/name} in the URL.
        # for every arg passed in, replace {...} with that arg
        # and remove the rest (they may or may not be optional)
        i = 0
        while m = /(\{[^\}]+\})/.exec(value)
          # `match` is something like `{/foo}`
          match = m[1]
          if i < args.length
            # replace it
            param = args[i]
            param = "/#{param}" if match[1] is '/'
          else
            # Discard the remaining optional params in the URL
            param = ''
            if match[1] isnt '/'
              throw new Error("BUG: Missing required parameter #{match}")
          value = value.replace(match, param)
          i++

        @_request('GET', value, null, null, cb) # TODO: Heuristically set the isBoolean flag
      fn = toPromise(fn)
      fn.url = value
      newKey = key.substring(0, key.length-'_url'.length)
      acc[plus.camelize(newKey)] = fn

    else if /_at$/.test(key)
      acc[plus.camelize(key)] = new Date(value)

    else
      acc[plus.camelize(key)] = @replace(value)


module.exports = Replacer
