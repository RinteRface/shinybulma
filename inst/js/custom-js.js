$(document).ready(function () {
  
  var first_id = $(".navTab").first().attr('id'); // first element
  
  $('#' + first_id).siblings('.navTab').each(function () {
     $(this).hide();
     $(this).removeClass('is-active');
  });
  
  // show first
  $("#" + first_id).show();
  $("#" + first_id).addClass('is-active');
  $("#" + first_id).css("display", "block");
});

function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('-');
}