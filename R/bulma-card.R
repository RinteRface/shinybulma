#' Add card
#'
#' Flexible card component.
#'
#' @inheritParams bulmaPage
#' @param tag html tag.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaSection(
#'      bulmaContainer(
#'        bulmaCard(
#'          bulmaCardHeader(
#'            bulmaCardHeaderTitle(
#'              "Card title"
#'            )
#'          ),
#'          bulmaCardContent(
#'            "Content of the card."
#'          ),
#'          bulmaCardFooter(
#'            bulmaCardFooterItem(
#'              "Item 1"
#'            ),
#'            bulmaCardFooterItem(
#'              "Item 2"
#'            )
#'          )
#'        )
#'      )
#'    )
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @rdname card
#' @export
bulmaCard <- function(...){
  shiny::tags$div(
    class = "card",
    ...
  )
}

#' @rdname card
#' @export
bulmaCardHeader <- function(...){
  shiny::tags$header(
    class = "card-header",
    ...
  )
}

#' @rdname card
#' @export
bulmaCardHeaderTitle <- function(...){
  shiny::tags$p(
    class = "card-header-title",
    ...
  )
}

#' @rdname card
#' @export
bulmaCardContent <- function(...){
  shiny::tags$div(
    class = "card-content",
    shiny::tags$div(
      class = "content",
      ...
    )
  )
}

#' @rdname card
#' @export
bulmaCardFooter <- function(...){
  shiny::tags$footer(
    class = "card-footer",
    ...
  )
}

#' @rdname card
#' @export
bulmaCardFooterItem <- function(..., tag = shiny::span){

  tag(
    class = "card-footer-item",
    ...
  )
}
