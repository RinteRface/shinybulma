var shinyBulmaRadio = new Shiny.InputBinding();
$.extend(shinyBulmaRadio, {
  find: function(scope) {
    return $(scope).find(".shinyBulmaRadio");
  },
  getValue: function(el) {
    return $(el).find('input:radio:checked').val();
  },
  subscribe: function(el, callback) {
    $(el).on("change.shinyBulmaRadio", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".shinyBulmaRadio");
  }
});

Shiny.inputBindings.register(shinyBulmaRadio);