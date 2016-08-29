function change_studio_option(){
  studio_id = $("#course_studio_id").find(":selected").val();
  $.ajax({
    url: "/admin/courses/change_studio",
    data: {studio_id: studio_id}
  });
};
function show_days_of_week() {
	var checkbox = document.getElementById("course_repeatable");
	if (checkbox) {
		$(".days_of_week").toggle(checkbox.checked);
	}
}
show_days_of_week();