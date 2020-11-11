$(function() {
  Shiny.addCustomMessageHandler("bulma-alert", function(message) {
    Bulma().alert(message);
    // rounded corners to the top of modal card if no header
    if (!message.showHeader) {
      $(".modal-card").css({"border-radius": "6px 6px 6px 6px"});
    }
  });
});