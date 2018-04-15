

var bulmaCalendarInput = new Shiny.InputBinding();
$.extend(bulmaCalendarInput, {
  find: function(scope) {
    return $(scope).find(".bulmaCalendarInput");
  },
  getValue: function(el) {
    console.log($(el).val());
    console.log($(el)["0"].value);
    return $(el)["0"].value;
  },
  subscribe: function(el, callback) {
    $(el).on("change.bulmaCalendarInput", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".bulmaCalendarInput");
  }
});

Shiny.inputBindings.register(bulmaCalendarInput);