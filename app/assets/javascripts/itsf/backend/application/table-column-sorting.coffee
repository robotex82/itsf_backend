$ ->
  $('table.dragtable').dragtable
    persistState: (table) ->
      if !window.sessionStorage
        return
      ss = window.sessionStorage
      table.el.find('th').each (i) ->
        if @id != ''
          table.sortOrder[@id] = i
        return
      ss.setItem "column-order.#{window.location.pathname}", JSON.stringify(table.sortOrder)
      console.log(ss)
      return
    restoreState: eval('(' + window.sessionStorage.getItem("column-order.#{window.location.pathname}") + ')')
            
$ ->
  $('[data-reset-column-order]').on 'click', (e) ->
    window.sessionStorage.removeItem "column-order.#{window.location.pathname}"
    false