$( function() {
  
   showHide = function(id){
     
     $(id).siblings(".navTab").hide();
     $(id).siblings(".navTab").trigger('hide');
     $(id).siblings(".navTab").trigger('hidden');
     $(id).siblings(".navTab").removeClass('is-active');
     
     $(id).addClass('is-active');
     $(id).css("display", "block");
     $(id).show();
     $(id).trigger('show');
     $(id).trigger('shown');
  };
});
