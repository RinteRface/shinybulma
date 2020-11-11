$( function() {
  $( ".bulmaTabs" ).tabs();
  $(".tabs li[role = 'tab']").on("click", function() {
     var $content = $($(this).children("a").attr("href"));
     $content.find(".shiny-bound-output").trigger("shown");
  });
} );
