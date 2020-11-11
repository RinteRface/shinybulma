$( function() {
  $( ".bulmaTabs" ).tabs();
  $(".tabs li[role = 'tab']").on("click", function() {
     var $this = $(this);
     var $content = $($this.children("a").attr("href"));
     $content.find(".shiny-bound-output").trigger("shown");
     $this.siblings().children("a").each((_, el) => 
         $($(el).attr("href")).find(".shiny-bound-output").trigger("hidden"));
  });
} );
