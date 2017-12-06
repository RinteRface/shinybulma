$(document).ready(function () {

    var shinyBulmaRadioInput = new Shiny.InputBinding();
    $.extend(shinyBulmaRadioInput, {
        find: function (scope) {
            return $(scope).find(".shinyBulmaRadio");
        },
        getValue: function (el) {
          var val = $('input[name=' + $(el).attr('id') + ']:checked').val();
          console.log(val);
          return val;
        },
        subscribe: function (el, callback) {
            $(el).on("change.shinyBulmaRadioInput", function (e) {
                callback();
            });
        },
        unsubscribe: function (el) {
            $(el).off(".shinyBulmaRadio");
        }
    });

    Shiny.inputBindings.register(shinyBulmaRadioInput);
});
