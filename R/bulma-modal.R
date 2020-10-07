#' Modal
#' 
#' Display a modal
#' 
#' @param title,body Content of the modal.
#' @param session A valid shiny session.
#' 
#' @examples
#' ui <- bulmaPage(
#'  bulmaActionButton("alert", "Send alert")
#' )
#' 
#' server <- function(input, output){
#'  observeEvent(input$alert, {
#'    bulmaModal("Hello", "World")
#'  })
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @export 
bulmaModal <- function(title, body, session = shiny::getDefaultReactiveDomain()){

}