var shinyCheckInput = new Shiny.InputBinding();
$.extend(shinyCheckInput, {
  find: function(scope) {
    return $(scope).find(".shinyCheckInput");
  },
  getValue: function(el) {
    var $objs = $(el).find('input:checkbox:checked');
    var values = new Array($objs.length);
    for (var i = 0; i < $objs.length; i ++) {
      values[i] = $objs[i].value;
    }
    console.log(values);
    return values;
  },
  subscribe: function(el, callback) {
    $(el).on("change.shinyCheckInput", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".shinyCheckInput");
  }
});

Shiny.inputBindings.register(shinyCheckInput);