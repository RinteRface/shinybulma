#' Add a footer
#'
#' @inheritParams bulmaPage
#'
#' @examples
#' library(shiny)
#' shinyApp(
#'   ui = bulmaPage(
#'     bulmaFooter(
#'       shiny::p(
#'         "The footer"
#'       )
#'     )
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @export
bulmaFooter <- function(..., container = TRUE){
  shiny::tags$footer(
    if(isTRUE(container)){
      tags$div(
        class = "container",
        ...
      )
    } else {
      ...
    }
  )
}
