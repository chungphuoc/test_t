# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$('.datepicker').datepicker
  autoclose: true
  format: 'yyyy-mm-dd'

$('#js_schedule').datepicker(todayHighlight: true).on 'changeDate', (e) ->
  date = e.date.getDate()+'-'+(e.date.getMonth()+1)+'-'+e.date.getFullYear()
  window.location = window.location.pathname + '?start_date=' + date