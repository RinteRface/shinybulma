$(document).ready(function () {

  var shinybulmaRadioBinding = new Shiny.InputBinding();
  $.extend(shinybulmaRadioBinding, {
    find: function(scope) {
      return $(scope).find(".bulma-radio");
    },
    getValue: function(el) {
      return parseInt($(el).val());
    },
    setValue: function(el, value) {
      $(el).text(value);
    },
    subscribe: function(el, callback) {
      $(el).on("change.shinybulmaRadioBinding", function(e) {
        callback();
      });
    },
    unsubscribe: function(el) {
      $(el).off(".shinybulmaRadioBinding");
    }
  });

  Shiny.inputBindings.register(shinybulmaRadioBinding);

});
