#' Create a bulma JS alert
#' 
#' Alert extension for bulma
#'
#' @param type Alert type. Either danger, warning, success or info.
#' @param title Alert title.
#' @param body Alert content.
#' @param confirm Confirm button text. May also be a JSON containing more options. See 
#' \url{https://bulmajs.tomerbe.co.uk/docs/master/2-core-components/alert/#confirm-cancel-events}
#' @param cancel Cancel button text. May also be a JSON containing more options. See 
#' \url{https://bulmajs.tomerbe.co.uk/docs/master/2-core-components/alert/#confirm-cancel-events}
#' @param showHeader Show the modal header. Default to TRUE.
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
#'        type = "danger",
#'        title = "An alert",
#'        body = "Ooohh what button you gonna click?"
#'      )
#'    })
#'  }
#'  
#'  shinyApp(ui, server)
#' }
bulmaAlert <- function(type = c("danger", "warning", "success", "info"),
                       title = NULL, body, confirm = "Ok", cancel = "cancel",
                       showHeader = TRUE, session = shiny::getDefaultReactiveDomain()) {
  type <- match.arg(type)
  
  message <- jsonlite::toJSON(
    dropNulls(
      list(
        type = type,
        title = title,
        body = body,
        confirm = confirm,
        cancel = cancel,
        showHeader = showHeader
      )
    ),
    pretty = TRUE,
    auto_unbox = TRUE
  )
  session$sendCustomMessage(type = "bulma-alert", message)
}
