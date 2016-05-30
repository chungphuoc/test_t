$ ->
  $('.datepicker').datepicker
    autoclose: true
    dateFormat : "yy-mm-dd"

  if $('#js_schedule')
    courseDateData = $('#js_schedule').data('course-date')
    dates = Object.keys(courseDateData || {})
    defaultDate = $('#js_schedule').data('default-date')

    highlightCoursesDates = ->
      for date in dates
        [y, m, d] = (parseInt(i) for i in date.split('-'))
        $("[data-month='#{m-1}'][data-year='#{y}']").filter ->
          $(this).text() == "#{d}"
        .append("<code>#{courseDateData[date]}</code>")

    $('#js_schedule').datepicker
      dateFormat: 'dd-mm-yy'
      defaultDate: defaultDate
      beforeShowDay: (date) ->
        if $.inArray(moment(date).format('YYYY-MM-DD', date), dates) > -1
          optionalClass = 'highlight'
        else
          optionalClass = ''
        return [true, optionalClass]
      onSelect: (date, instance) ->
        window.location = window.location.pathname + '?start_date=' + date

    highlightCoursesDates()

    $(document).on 'click', '.ui-datepicker-next, .ui-datepicker-prev', ->
      highlightCoursesDates()
