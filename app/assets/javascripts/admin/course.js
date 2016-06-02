function change_studio_option(){
  studio_id = $("#studio_studio_id").find(":selected").val();
  $.ajax({
    url: "/admin/courses/change_studio",
    data: {studio_id: studio_id}
  });
};