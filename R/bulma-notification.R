#' @title bulma notification
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a notification box \url{https://bulma.io/documentation/elements/notification/}.
#'
#' @param body Content of the alert.
#' @param session A valid shiny session.
#' @param color The background color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#'
#' @examples
#' library(shiny)
#' 
#' ui <- bulmaPage(
#'  bulmaActionButton("alert", "Send alert")
#' )
#' 
#' server <- function(input, output){
#'  observeEvent(input$alert, {
#'    bulmaNotification(color = "red")
#'  })
#' }
#' 
#' if(interactive())
#'  shinyApp(ui, server)
#' 
#' @export
bulmaNotification <- function(body, color = NULL, session = shiny::getDefaultReactiveDomain()) {

}
