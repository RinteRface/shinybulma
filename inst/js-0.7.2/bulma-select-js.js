$(document).ready(function () {

    var shinyBulmaSelectInput = new Shiny.InputBinding();
    $.extend(shinyBulmaSelectInput, {
        find: function (scope) {
            return $(scope).find(".shinyBulmaSelect");
        },
        getValue: function (el) {
          console.log($(el).val());
          return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shinyBulmaSelectInput", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shinyBulmaSelect");
        }
    });

    Shiny.inputBindings.register(shinyBulmaSelectInput);
});
