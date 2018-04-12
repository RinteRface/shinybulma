$(document).ready(function () {
  
    $(document).on("click", ".shinyBulmaActionButton", function(evt) {
        var el = $(evt.target);
        var curVal = parseInt(el.val());
        el.val(curVal + 1);
        console.log(el.val());
        el.trigger("change");
    });
    
    var shinyBulmaActionButton = new Shiny.InputBinding();
    $.extend(shinyBulmaActionButton, {
      find: function(scope) {
        return $(scope).find(".shinyBulmaActionButton");
      },
      getValue: function(el) {
        return parseInt($(el).val());
      },
      subscribe: function(el, callback) {
        $(el).on("change.shinyBulmaActionButton", function(e) {
          console.log(el);
          callback();
        });
      },
      unsubscribe: function(el) {
        $(el).off(".shinyBulmaActionButton");
      }
    });
    
    Shiny.inputBindings.register(shinyBulmaActionButton);
});