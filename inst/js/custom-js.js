//$( ".navTab" ).first().css( "display", "block" );
//$( ".navTab" ).first().addClass("active");
$(document).ready(function () {
  // hide all
  $(".navTab").hide();
  $(".navTab").removeClass('is-active');

  // show first
  $(".navTab").first().show();
  $(".navTab").first().addClass('active');
});

