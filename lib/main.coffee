cmui = require './cmui-classes'

provider =
  selector: '.source.jedi'
  disableForSelector: '.source.jedi .comment'
  getSuggestions: (request) ->
    @getCMUISuggestions(request) if atom.config.get('language-jedi.enableCMUISnippets')
  getCMUISuggestions: ({prefix}) ->
    new Promise (resolve) ->
      suggestions = cmui.map ({text, label}) ->
        if text.indexOf(prefix) == 0
          text: text
          displayText: text
          type: 'class'
          rightLabel: label
      .filter (e) -> e
      resolve(suggestions)

module.exports =
  activate: ->
  provide: -> provider
