function show_days_of_week() {
	var checkbox = document.getElementById("course_repeatable");
	$(".days_of_week").toggle(checkbox.checked);
}
show_days_of_week();