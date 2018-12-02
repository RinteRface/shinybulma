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
            $(el).on("input.shinyBulmaText keyup.shinyBulmaText", function (e) {
                callback(true);
            });
            $(el).on("change.shinyBulmaText", function (e) {
                callback(true);
            });
        },
        unsubscribe: function(el) {
          $(el).off(".shinybulmaTextInput");
        },
        receiveMessage: function(el, data){
           if (data.hasOwnProperty('value')) this.setValue(el, data.value); 
        },
        setValue: function(el, value) {
          el.value = value;
        }
    });

    Shiny.inputBindings.register(shinyBulmaText);
});
