timerid = undefined

$ ->
  $('[data-auto-submit=true]').keyup ->
    form = this
    clearTimeout timerid
    timerid = setTimeout((->
      form.submit()
      return
    ), 500)
    return

$ ->
  $('[data-auto-submit=true]').change ->
    form = this
    clearTimeout timerid
    timerid = setTimeout((->
      form.submit()
      return
    ), 500)
    return