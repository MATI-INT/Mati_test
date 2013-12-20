jQuery ->
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