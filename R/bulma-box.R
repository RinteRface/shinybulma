#' @title bulma Box
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a simple box with or without media \url{https://bulma.io/documentation/elements/box/}.
#'
#' @param ... Any element.
#'
#' @note It is lighter than a bulmaCard element.
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
#'       width = 6,
#'       bulmaBox(
#'         bulmaBoxMedia(
#'           src = "https://bulma.io/images/placeholders/128x128.png",
#'           "test"
#'         )
#'       )
#'     ),
#'     bulmaDivider(vertical = TRUE),
#'     bulmaColumn(
#'       width = 6,
#'       bulmaBox(
#'         "test"
#'       )
#'      )
#'     )
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

bulmaBox <- function(...) {
  shiny::tags$div(
    class = "box",
    shiny::tags$article(
      class = "media",
      ...
    )
  )
}




#' @title bulma Box media.
#'
#' @description Create a media to insert in a bulmaBox.
#'
#' @param ... any element.
#' @param src link to the media.
#' @param size Media size.
#'
#' @details
#' Valid \code{size}:
#' \itemize{
#'   \item{16 - 16x16}
#'   \item{24 - 24x24}
#'   \item{32 - 32x32}
#'   \item{48 - 48x48}
#'   \item{54 - 54x54}
#'   \item{96 - 96x96}
#'   \item{128 - 128x128}
#' }
#'
#' @rdname box
#' @export
#'


bulmaBoxMedia <- function(..., src = NULL, size = "64x64") {
  tagList(
    # media left
    shiny::tags$div(
      class = "media-left",
      bulmaFigure(src = src, size = size)
    ),
    # body
    shiny::tags$div(
      class = "media-content",
      shiny::tags$div(
        class = "content",
        shiny::tags$p(...)
      )
    )
  )
}
