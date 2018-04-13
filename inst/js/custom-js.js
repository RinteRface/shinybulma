//$( ".navTab" ).first().css( "display", "block" );
//$( ".navTab" ).first().addClass("active");
$(document).ready(function () {
  var first_id = $(".navTab").first().attr('id'); // first element
  
  // hide all
  $("#" + first_id).siblings(".navTab").hide();
  
  $('#' + first_id).siblings('.navTab').each(function (idx, el) {
    $('#' + el.id).trigger('shiny:visualchange', { visible: false, binding: el.id });
  });
  
  // show first
  $("#" + first_id).show();
  $("#" + first_id).trigger('shiny:visualchange', { visible: true, binding: first_id });
  $("#" + first_id).addClass('is-active');
});