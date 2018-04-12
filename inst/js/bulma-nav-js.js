$( function() {
   showHide = function(id){
     $(id).show();
     $(id).siblings("div").hide();
     $(id).siblings("div").removeClass('active');
     $(id).addClass("active");
     $(id).css('display', 'block');
  };
});
