
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

