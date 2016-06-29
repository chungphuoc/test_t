function displaySearch(){
  var search_form = $('#search-form');
  if (search_form.hasClass('hidden')) {
    $('#show-search').text('Hide Search');
    search_form.removeClass('hidden');
    setTimeout(function () {
      search_form.removeClass('visuallyhidden');
    }, 50);
  } else {
    $('#show-search').text('Show Search');
    search_form.addClass('visuallyhidden');
    search_form.one('transitionend', function(e) {
      search_form.addClass('hidden');
    });
  }
}