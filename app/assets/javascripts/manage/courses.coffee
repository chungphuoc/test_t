# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.datepicker').datepicker
  autoclose: true
  format: 'YYYY-MM-DD'

dates = $('table').data('course-date')
$('#js_schedule').datepicker(
  todayHighlight: true,
  beforeShowDay: (date) ->
    if $.inArray(moment(date).format('YYYY-MM-DD', date), dates) > -1
      return 'highlighted-date'
).on 'changeDate', (e) ->
  date = moment(e.date).format('DD-MM-YYYY')
  window.location = window.location.pathname + '?start_date=' + date