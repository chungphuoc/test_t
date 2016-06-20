function booked_class(){
  $.ajax({
    url: "/manage/enrollments/booked",
    data: {},
    success: function(result){
      $("#enrollment-table").html(result);
      $("#btn-passed").removeClass("button-class-active");
      $("#btn-booked").addClass("button-class-active");
    }
  });
};

function passed_class(){
  $.ajax({
    url: "/manage/enrollments/passed",
    data: {},
    success: function(result){
      $("#btn-booked").removeClass("button-class-active");
      $("#btn-passed").addClass("button-class-active");
      $("#enrollment-table").html(result);
    }
  });
};

function change_course_option(){
  course_id = $("#courses").find(":selected").val();
  type = 'book';
  $.ajax({
    url: "/manage/enrollments/change_course",
    data: {course_id: course_id, type: type}
  });
}

function search_by_join_date(){
  course_id = $("#courses").find(":selected").val();
  join_date = $("#join_date").find(":selected").val();
  status = 'passed';
  if ($(".button-class-active").attr('id') == "btn-booked") {
    status = "paid"
  };
  $.ajax({
    url: "/manage/enrollments/by_join_date",
    data: {course_id: course_id, join_date: join_date, status: status},
    success: function(result){
      $("#enrollment-table").html(result);
    }
  });
}