(function($) {
  "use strict";
  var params = window.location.search.replace("?", "");
  var language = params.split("&")
                       .filter(function(x) { return x.startsWith("locale"); })[0]
                       .replace("locale=", "");
  language = language == "en" ? 'en-US' : 'ja-JP';
  var options = {
    events_source: '/manage/courses.json?' + params,
    view: 'week',
    tmpl_path: '/bower_components/bootstrap-calendar/tmpls/',
    tmpl_cache: false,
    onAfterEventsLoad: function(events) {
      if(!events) {
        return;
      }
      var list = $('#eventlist');
      list.html('');

      $.each(events, function(key, val) {
        $(document.createElement('li'))
          .html('<a href="' + val.url + '">' + val.title + '</a>')
          .appendTo(list);
      });
    },
    onAfterViewLoad: function(view) {
      $('#studio-date-title h3').text(this.getTitle());
      $('.btn-group button').removeClass('active');
      $('button[data-calendar-view="' + view + '"]').addClass('active');
    },
    classes: {
      months: {
        general: 'label'
      }
    },
    language: language
  };

  var calendar = $('#calendar').calendar(options);

  $('.btn-group button[data-calendar-nav]').each(function() {
    var $this = $(this);
    $this.click(function() {
      calendar.navigate($this.data('calendar-nav'));
    });
  });

  $('.btn-group button[data-calendar-view]').each(function() {
    var $this = $(this);
    $this.click(function() {
      calendar.view($this.data('calendar-view'));
    });
  });

  $('#first_day').change(function(){
    var value = $(this).val();
    value = value.length ? parseInt(value) : null;
    calendar.setOptions({first_day: value});
    calendar.view();
  });

  $('#language').change(function(){
    calendar.setLanguage($(this).val());
    calendar.view();
  });

  $('#events-in-modal').change(function(){
    var val = $(this).is(':checked') ? $(this).val() : null;
    calendar.setOptions({modal: val});
  });
  $('#format-12-hours').change(function(){
    var val = $(this).is(':checked') ? true : false;
    calendar.setOptions({format12: val});
    calendar.view();
  });
  $('#show_wbn').change(function(){
    var val = $(this).is(':checked') ? true : false;
    calendar.setOptions({display_week_numbers: val});
    calendar.view();
  });
  $('#show_wb').change(function(){
    var val = $(this).is(':checked') ? true : false;
    calendar.setOptions({weekbox: val});
    calendar.view();
  });
  $('#events-modal .modal-header, #events-modal .modal-footer').click(function(e){
    //e.preventDefault();
    //e.stopPropagation();
  });
}(jQuery));