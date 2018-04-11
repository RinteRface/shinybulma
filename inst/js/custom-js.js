//$( ".navTab" ).first().css( "display", "block" );
//$( ".navTab" ).first().addClass("active");
$(document).ready(function () {
  // hide all
  $(".navTab").hide();
  $(".navTab").trigger('hide');
  $(".navTab").trigger('hidden');
  $(".navTab").removeClass('active');

  // show first
  $(".navTab").first().show();
  $(".navTab").first().addCalss('active');
});

