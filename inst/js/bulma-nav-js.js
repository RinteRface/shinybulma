$( function() {
  
   showHide = function(id){
     
     $(id).siblings(".navTab").hide();
     $(id).siblings(".navTab").removeClass('is-active');
     
     $(id).siblings('.navTab').each(function (idx, el) {
         $('#' + el.id + ' *').each(function(x, y) {
           $('#' + el.id).trigger('shiny:visualchange', { visible: false, binding: el.id });
           if(y.id.replace('#', '') !== ''){
            $('#' + y.id).trigger('shiny:visualchange', { visible: false, binding: y.id }); 
           }
         });
     });
     
     $(id).show();
     $(id).addClass('is-active');
     $(id).trigger('shiny:visualchange', { visible: true, binding: id.replace('#', '') });
     $(id + ' *').each(function(x, y){
         if(y.id === ''){
         } else {
          $('#' + y.id).trigger('shiny:visualchange', { visible: true, binding: y.id }); 
         }
     });
  };
});
