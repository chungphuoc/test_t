function change_join_day_option(){
  course_id = $("#enrollment_course_id").find(":selected").val();
  $.ajax({
    url: "/admin/enrollments/change_course",
    data: {course_id: course_id},
    success: function(result){
    }
  });
};