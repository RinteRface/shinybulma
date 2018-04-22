var first_id = $(".navTab").first().attr('id'); // first element

$('#' + first_id).siblings('.navTab').each(function () {
   $(this).hide();
   $(this).trigger('hide');
   $(this).trigger('hidden');
   $(this).removeClass('is-active');
   $(this).css("display", "none");
});

// show first
$("#" + first_id).show();
$("#" + first_id).trigger('show');
$("#" + first_id).trigger('shown');
$("#" + first_id).addClass('is-active');
$("#" + first_id).css("display", "block");