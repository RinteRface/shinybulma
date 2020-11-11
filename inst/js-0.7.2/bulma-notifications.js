$(function() {
  Shiny.addCustomMessageHandler('bulma-notification', function(message) {
    if (message.id === undefined) {
      Bulma('body').notification(message.options).show();
    } else {
      Bulma('#' + message.id).notification(message.options).show();
    }
  });
});