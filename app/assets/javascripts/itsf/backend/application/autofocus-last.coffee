$ ->
  $('[data-autofocus=last]').on('focus', ->
    this.value = this.value
  )