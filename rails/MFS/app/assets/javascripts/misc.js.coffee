jQuery ->
  form_button = $('#submit_user_form')
  form_button.attr('disabled', 'disabled')

  email_regexp = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  $('#user_email').on('keyup', ->
    if email_regexp.test($(this).val())
      form_button.removeAttr('disabled')
      form_button.addClass('valid_form')
    else
      form_button.attr('disabled', 'disabled')
      form_button.removeClass('valid_form')
  )





  $('.make-jscrollpane').jScrollPane {
    mouseWheelSpeed: 70
    autoReinitialise: true
  }

  $('.force_submit_form').on('click', (e) ->
    e.preventDefault()
    $this = $(this)
    form = $this.parents('form')
    form.submit() if form.size() > 0
  )

  return