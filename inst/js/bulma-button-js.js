
$(document).on("click", "button.shinyBulmaActionButton", function(evt) {
    var el = $(evt.target);
    el.val(parseInt(el.val()) + 1 + 1);
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
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".shinyBulmaActionButton");
  }
});

Shiny.inputBindings.register(shinyBulmaActionButton);
