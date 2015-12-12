rotation = ->
  $('#navigation-logo > .itsf-logo-38').rotate
    angle: 0
    animateTo: 360
    callback: rotation
  return

$ ->
  $('a').click ->
    rotation()

  $('a *').click ->
    rotation()

  $('input[type="submit"]').click ->
    rotation()

  $('#navigation-logo > .itsf-logo-38').rotate bind:
    mouseover: ->
      $(this).rotate animateTo: 180
      return
    mouseout: ->
      $(this).rotate animateTo: 0
      return