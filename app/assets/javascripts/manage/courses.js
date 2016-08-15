function show_days_of_week() {
	var checkbox = document.getElementById("course_repeatable");
	if (checkbox) {
		$(".days_of_week").toggle(checkbox.checked);
	}
}
show_days_of_week();