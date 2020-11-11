$(function() {
  Shiny.addCustomMessageHandler("bulma-alert", function(message) {
    Bulma().alert(message[0]);
    // rounded corners to the top of modal card if no header
    if (!message[0].showHeader) {
      $(".modal-card").css({"border-radius": "6px 6px 6px 6px"});
    }
  });
});