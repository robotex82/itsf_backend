timerid = undefined

$ ->
  $('[data-auto-submit=true]').keyup ->
    form = this
    clearTimeout timerid
    timerid = setTimeout((->
      form.submit()
      return
    ), 1000)
    return

$ ->
  $('[data-auto-submit=true]').change ->
    form = this
    clearTimeout timerid
    timerid = setTimeout((->
      form.submit()
      return
    ), 1000)
    return