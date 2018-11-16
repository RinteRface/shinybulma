
 $(".pageloader").css('display', 'block');
 $(".pageloader").addClass('is-active');

$(window).on('load', function () {
  $(".pageloader").removeClass('is-active');
  $(".pageloader").css('display', 'none');
});