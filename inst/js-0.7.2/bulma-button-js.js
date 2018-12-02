
$(document).on("click", "button.shinyBulmaActionButton", function(evt) {
    var el = $(evt.target);
    el.val(parseInt(el.val()) + 1);
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
    $(el).on("click.shinyBulmaActionButton", function(e) {
      var $el = $(this);
      var val = $el.data('val') || 0;
      $el.data('val', val + 1);

      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".shinyBulmaActionButton");
  }
});

Shiny.inputBindings.register(shinyBulmaActionButton);
