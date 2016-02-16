$ ->
  $('#pagination-size').on 'change', (e) ->
    queryParameters = {}
    queryString = location.search.substring(1)
    re = /([^&=]+)=([^&]*)/g
    m = undefined

    while m = re.exec(queryString)
      queryParameters[decodeURIComponent(m[1])] = decodeURIComponent(m[2])

    per_page = $(@).val()
    queryParameters['per_page'] = per_page
    location.search = $.param(queryParameters)