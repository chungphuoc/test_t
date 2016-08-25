function show_days_of_week() {
	var checkbox = document.getElementById("course_repeatable");
	if (checkbox) {
		$(".days_of_week").toggle(checkbox.checked);
	}
}
show_days_of_week();

function monthChanged() {
  var days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  var month = $('#course_start_date_2i').val() - 1,
      year = +$('#course_start_date_1i').val();

  // Check for leap year if Feb
  if (month == 1 && new Date(year, month, 29).getMonth() == 1) days[1]++;

  // Add/Remove options
  var options = $('#course_start_date_3i option');
  if (options.length > days[month]) {
    // Remove
    options.slice(days[month]).remove();
  } else if (options.length < days[month]) {
    // Add
    for (var i = options.length + 1; i <= days[month]; i++) {
      $('<option>').attr('value', i).text(i).appendTo('#course_start_date_3i');
    }
  }
}

$(function () {
  monthChanged(); // On document ready
  $('#course_start_date_2i').change(monthChanged); // On month change
  $('#course_start_date_1i').change(monthChanged); // On year change (for leap years)
});