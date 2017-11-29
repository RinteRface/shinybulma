#' Add container
#'
#' @inheritParams bulmaPage
#' @param fluid If you don't want to have a maximum width but want to keep the 24px margin on the left and right sides.
#' @param fullwidth until the \code{widescreen} breakpoint.
#' @param fullhd until the \code{fullhd} breakpoint.
#'
#' @export
bulmaContainer <- function(..., fluid = FALSE, widescreen = FALSE, fullhd = FALSE){

  cl <- "container"

  if(isTRUE(fluid)) cl <- paste(cl, "is-fluid")

  shiny::tags$div(
    class = cl,
    ...
  )
}
