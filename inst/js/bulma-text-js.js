$(document).ready(function () {

    var shinyBulmaText = new Shiny.InputBinding();
    $.extend(shinyBulmaText, {
        find: function (scope) {
            return $(scope).find(".shinybulmaTextInput");
        },
        getValue: function (el) {
            return $(el).val();
        },
        subscribe: function (el, callback) {
            $(el).on("change.shinyBulmaText", function (e) {
                callback();
            });
        }
    });

    Shiny.inputBindings.register(shinyBulmaText);
});
