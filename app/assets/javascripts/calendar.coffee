$(document).on 'turbolinks:load', ->
  $('#calendar').fullCalendar {defaultView: 'agendaWeek'}
  return

$(document).on 'turbolinks:before-cache', ->
  $('#calendar').empty()
  return