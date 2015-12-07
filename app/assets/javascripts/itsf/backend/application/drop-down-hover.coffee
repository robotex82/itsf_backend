$ ->
  $('.dropdown').hover (->
    $(this).addClass 'open'
    return
  ), ->
    $(this).removeClass 'open'
    return
  return