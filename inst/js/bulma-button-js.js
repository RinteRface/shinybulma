$(document).ready(function () {

  var shinyBulmaSubmitButton = new Shiny.InputBinding();
  $.extend(shinyBulmaSubmitButton, {
    find: function (scope) {
      return $(scope).find(".shinyBulmaRadio");
    },
    getValue: function (el) {
      return $(el).val();
    },
    subscribe: function (el, callback) {
      $(el).on("change.shinyBulmaSubmitButton", function (e) {
        callback();
      });
    },
    unsubscribe: function (el) {
      $(el).off(".shinyBulmaRadio");
    }
  });

  Shiny.inputBindings.register(shinyBulmaSubmitButton);
});
