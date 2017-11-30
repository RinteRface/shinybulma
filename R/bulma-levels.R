#' Add level
#'
#' Add levels
#'
#' @inheritParams bulmaPage
#' @param mobile set to \code{TRUE} if you want the level to be horizontal on mobile.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'     bulmaLevel(
#'       bulmaLevelItem("Tweets", "3'456"),
#'       bulmaLevelItem("Following", 123),
#'       bulmaLevelItem("Followers", "456K")
#'     )
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @rdname level
#' @export
bulmaLevel <- function(..., mobile = FALSE){

  cl <- "level"

  if (isTRUE(mobile)) cl <- paste(cl, "is-mobile")

  shiny::tags$nav(
    class = cl,
    ...
  )
}

#' @rdname level
#' @export
bulmaLevelItem <- function(heading, value, centered = TRUE){

  if(missing(heading) | missing(value))
    stop("heading and title must be passed", call. = FALSE)

  cl <- "level-item"

  if(isTRUE(centered)) cl <- paste(cl, "has-text-centered")

  shiny::tags$div(
    class = cl,
    shiny::tags$div(
      tags$p(
        class = "heading",
        heading
      ),
      tags$p(
        class = "title",
        value
      )
    )
  )
}
