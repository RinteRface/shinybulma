#' Add tabs
#'
#' @export
bulmaTabs <- function(..., centered = FALSE){

  cl <- "tabs"

  if(isTRUE(center)) cl <- paste(cl, "is-centered")

  shiny::tags$div(
    class = cl,
    shiny::tags$ul(
      ...
    )
  )
}

#' Add tab
#'
#' @export
bulmaTab <- function(label){

  shiny::tags$li(
    shiny::tags$a(
      label
    )
  )
}
