#' Add subtitle
#'
#' @inheritParams bulmaPage
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
bulmaTitle <- function(...){
  shiny::tags$h1(
    class = "title",
    ...
  )
}

#' @rdname title
#' @export
bulmaSubtitle <- function(...){
  shiny::tags$h1(
    class = "subtitle",
    ...
  )
}
