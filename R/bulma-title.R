#' Add subtitle
#'
#' @inheritParams bulmaPage
#' @param tag html tag.
#'
#' @examples
#' shinyApp(
#'   ui = bulmaPage(
#'     bulmaHero(
#'       fullheight = TRUE,
#'       color = "primary",
#'       bulmaHeroHead(
#'         bulmaContainer(
#'           bulmaTitle("Hero Title")
#'         )
#'       ),
#'       bulmaHeroHead(
#'         bulmaContainer(
#'           bulmaSubtitle(
#'             "Some content"
#'           )
#'         )
#'       ),
#'       bulmaHeroFoot(
#'         bulmaContainer(
#'           "The footer"
#'         )
#'       )
#'     )
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @rdname title
#' @export
bulmaTitle <- function(..., tag = shiny::h1){
  tag(
    class = "title",
    ...
  )
}

#' @rdname title
#' @export
bulmaSubtitle <- function(..., tag = shiny::h2){
  tag(
    class = "subtitle",
    ...
  )
}
