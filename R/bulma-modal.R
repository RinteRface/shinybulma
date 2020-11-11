#' Modal
#' 
#' Display a modal
#' 
#' @param id Unique modal id.
#' @param options Modal configuration. See \url{https://github.com/VizuaaLOG/BulmaJS}.
#' @param session A valid shiny session.
#' 
#' @examples
#' library(shiny)
#' ui <- bulmaPage(
#'  bulmaActionButton("show_modal", "Show modal"),
#'  bulmaActionButton("show_modal2", "Show modal 2")
#' )
#' 
#' server <- function(input, output){
#'  observeEvent(input$show_modal, {
#'    bulmaModal(
#'     id = "mymodal", 
#'     list(
#'      title = "Modal title",
#'      body = "Modal content"
#'     )
#'    )
#'  })
#'  observeEvent(input$show_modal2, {
#'    bulmaModal(
#'     id = "mymodal2", 
#'     list(
#'      title = "Modal title 2",
#'      body = "Modal content 2"
#'     )
#'    )
#'  })
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @export 
bulmaModal <- function(id, options, session = shiny::getDefaultReactiveDomain()){
  message <- list(id = id, options = options)
  session$sendCustomMessage(type = "bulma-modal", message)
}