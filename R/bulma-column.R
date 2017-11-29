#' Add a column
#'
#' @inheritParams bulmaPage
#'
#' @export
bulmaColumns <- function(...){
  shiny::tags$div(
    class = "columns",
    ...
  )
}

#' Add a column
#'
#' @inheritParams bulmaPage
#'
#' @export
bulmaColumn <- function(...){
  shiny::tags$div(
    class = "column",
    ...
  )
}
