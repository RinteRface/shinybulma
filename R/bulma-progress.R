#' Add a progress bar
#'
#' Add a progress bar.
#'
#' @inheritParams bulmaPage
#' @param value value of progress.
#' @param max maximum value.
#' @param size size of progress bar, default to \code{NULL}
#' takes \code{small}, \code{meidum} or \code{large}.
#' @param color color of progress bar.
#' @param outputId id of element.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaProgress("15%", value = 15, max = 100),
#'    bulmaProgress("25%", value = 25, max = 100, color = "primary"),
#'    bulmaProgress("65%", value = 65, max = 100, color = "danger", size = "medium"),
#'    bulmaProgressOutput("progress")
#'   ),
#'   server = function(input, output) {
#'     output$progress <- renderBulmaProgress({
#'       bulmaProgress(
#'         value = sample(1:100, 1)
#'       )
#'     })
#'   }
#' )
#' }
#'
#' @rdname progress
#' @export
bulmaProgress <- function(..., value, max = 100, color = NULL, size = NULL){
  if(missing(value))
    stop("missing value")

  cl <- "progress"

  if(!is.null(color)) cl <- paste0(cl, " is-", color)
  if(!is.null(size)) cl <- paste0(cl, " is-", size)

  shiny::tags$progress(
    value = value,
    max = max,
    class = cl,
    ...
  )
}

#' @rdname progress
#' @inheritParams shiny::renderUI
#' @export
renderBulmaProgress <- function(expr, env = parent.frame(), quoted = FALSE){

  prog_fun <- shiny::exprToFunction(expr, env, quoted)

  shiny::renderUI({
    prog <- prog_fun()
  })
}

#' @rdname progress
#' @export
bulmaProgressOutput <- function(outputId){
  shiny::uiOutput(outputId)
}
