

module.exports =
  class InternalsCommand
    run : (h) ->
      console.log({
        globalDir : h.globalDir
        cacheDIr  : h.cacheDir
      })
