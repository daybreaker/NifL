$ ->
  $(document).on 'ajax:success', 'form', (event, data, status, xhr)->
    target = $(this).data('update-target')
    console.log target
    $('#' + target).replaceWith(data)

    return

  $(document).on 'click', '.make-pick', (e)->
    e.preventDefault()
    console.log "WHAT"
    form = $(this).parent("form")
    form.submit()
    return
  return
  
