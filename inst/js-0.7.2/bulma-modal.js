$(function() {
  Shiny.addCustomMessageHandler('bulma-modal', function(message) {
    $('body').append(`<div id ="${message.id}"></div>`);
    var modal = Bulma('#' + message.id).modal(message.options);
    modal.open();
    // remove modal from dom when consummed.
    $('#' + message.id + ' > div.modal-card > header > button').on('click', function() {
      modal.destroy();
    });
  });
});