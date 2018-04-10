#' @title bulma notification
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a notification box \url{https://bulma.io/documentation/elements/notification/}.
#'
#' @param ... Any element.
#' @param color The background color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'  library(shiny)
#'
#'  ui <- bulmaPage(
#'   bulmaContainer(
#'    bulmaColumns(
#'     bulmaColumn(
#'       width = 3,
#'       bulmaNotification(
#'         color = "info",
#'         "Lorem ipsum dolor sit amet, consectetur adipiscing
#'         elit lorem ipsum dolor. Pellentesque risus mi, tempus
#'         quis placerat ut, porta nec nulla. Vestibulum rhoncus
#'         ac ex sit amet fringilla. Nullam gravida purus diam,
#'         et dictum felis venenatis efficitur. Sit amet,
#'         consectetur adipiscing elit"
#'       )
#'     ),
#'     bulmaColumn(
#'       width = 3,
#'       bulmaNotification(
#'         color = "warning",
#'         "Lorem ipsum dolor sit amet, consectetur adipiscing
#'         elit lorem ipsum dolor. Pellentesque risus mi, tempus
#'         quis placerat ut, porta nec nulla. Vestibulum rhoncus
#'         ac ex sit amet fringilla. Nullam gravida purus diam,
#'         et dictum felis venenatis efficitur. Sit amet,
#'         consectetur adipiscing elit"
#'       )
#'     ),
#'     bulmaColumn(
#'       width = 3,
#'       bulmaNotification(
#'         color = "danger",
#'         "Lorem ipsum dolor sit amet, consectetur adipiscing
#'         elit lorem ipsum dolor. Pellentesque risus mi, tempus
#'         quis placerat ut, porta nec nulla. Vestibulum rhoncus
#'         ac ex sit amet fringilla. Nullam gravida purus diam,
#'         et dictum felis venenatis efficitur. Sit amet,
#'         consectetur adipiscing elit"
#'       )
#'     ),
#'     bulmaColumn(
#'       width = 3,
#'       bulmaNotification(
#'         color = "primary",
#'         "Lorem ipsum dolor sit amet, consectetur adipiscing
#'         elit lorem ipsum dolor. Pellentesque risus mi, tempus
#'         quis placerat ut, porta nec nulla. Vestibulum rhoncus
#'         ac ex sit amet fringilla. Nullam gravida purus diam,
#'         et dictum felis venenatis efficitur. Sit amet,
#'         consectetur adipiscing elit"
#'       )
#'     )
#'    )
#'   )
#'  )
#'
#'  server <- function(input, output, session) {
#'
#'  }
#'
#'  shinyApp(ui = ui, server = server)
#'
#' }
#' }

bulmaNotification <- function(..., color = NULL) {

  cl <- "notification"
  if (!is.null(color)) cl <- paste0(cl, " is-", color)

  shiny::tags$div(
    class = cl,
    ...
  )
}
