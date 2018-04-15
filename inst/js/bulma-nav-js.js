$( function() {
  
   showHide = function(id){
     
     $(id).siblings(".navTab").hide();
     $(id).siblings(".navTab").removeClass('is-active');
     
     $(id).addClass('is-active');
     $(id).css("display", "block");
     $(id).show();
  };
});
