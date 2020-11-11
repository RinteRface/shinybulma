#' Create a bulma JS alert
#' 
#' Alert extension for bulma
#'
#' @param options List containing alert configuration. See \url{https://bulmajs.tomerbe.co.uk/}.
#' @param session Shiny session object. Internal use.
#'
#' @return An alert message
#' @export
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  library(shinybulma)
#'  
#'  ui <- bulmaPage(
#'    bulmaActionButton("alert", "Show alert")
#'  )
#'  
#'  server <- function(input, output, session) {
#'    observeEvent(input$alert, {
#'      bulmaAlert(
#'        list(
#'         type = "warning",
#'         title = "Warning!!!", 
#'         body = "Notification content", 
#'         confirm = "Ok", 
#'         cancel = "cancel",
#'         showHeader = TRUE
#'        )
#'      )
#'    })
#'  }
#'  
#'  shinyApp(ui, server)
#' }
bulmaAlert <- function(options, session = shiny::getDefaultReactiveDomain()) {
  message <- list(options)
  session$sendCustomMessage(type = "bulma-alert", message)
}
