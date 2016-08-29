function correct_days() {
  year = $("#customer_birthday_1i").val();
  current_days = $("#customer_birthday_3i > option").length;
  month = $("#customer_birthday_2i").val();
  days = new Date(year, month, 0).getDate();
  changed_days = days - current_days;
  $days = $("#customer_birthday_3i");
  if (changed_days < 0) {
    for (i = 0; i < Math.abs(changed_days); i++) {
      $days.children().last().remove();
    }
  } else if (changed_days > 0) {
    for (i = 0; i < changed_days; i++) {
      add_days = current_days + i + 1;
      $days.append("<option value=" + add_days +
        ">" + add_days + "</option>");
    }
  }
};

$(document).ready(function() {
  correct_days();

  $("#customer_birthday_2i").on("change", function() {
    correct_days();
  });
});
