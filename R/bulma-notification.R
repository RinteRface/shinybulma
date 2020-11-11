#' @title bulma notification
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a notification box \url{https://bulma.io/documentation/elements/notification/}.
#'
#' @param id Notification target. It will be attached on the provided DOM element. If id is NULL,
#' the notification is attached to the body.
#' @param options A list of notification options. See \url{https://github.com/VizuaaLOG/BulmaJS}.
#' @param session A valid shiny session.
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#' 
#'  ui <- bulmaPage(
#'   bulmaActionButton("show_notif", "Show notification"),
#'   div(id = "target", style = "top: 0px; right: 0px; position: absolute;")
#'  )
#'  
#'  server <- function(input, output, session) {
#'   observeEvent(input$show_notif, {
#'     bulmaNotification(
#'       id = "target", 
#'       options = list(
#'         body = "This is the message",
#'         color = "info",
#'         dismissInterval = 200000,
#'         isDismissable = TRUE
#'       )
#'     )
#'   })
#'  }
#'  shinyApp(ui, server)
#' }
#' @export
bulmaNotification <- function(id = NULL, options = NULL, session = shiny::getDefaultReactiveDomain()) {
  message <- dropNulls(
    list(
      id = id,
      options = options
    )
  )
  
  session$sendCustomMessage(type = "bulma-notification", message)
}
