$(document).on 'turbolinks:load', ->
  $('.ui-autocomplete-input').each ->
    element = $(this)
    target = $(this).attr('data-source-url')

    element.autocomplete
      source: target
      minLength: 2
      html: true
      open: (event, ui) ->
        $('.ui-autocomplete').css 'z-index', 1000
        return
      create: ->
        $(this).data('ui-autocomplete')._renderItem = (ul, item) ->
          $("<li>").append("<span>" + item.title + "<br><small>" + item.subtitle + "</small></span>").appendTo ul
    return