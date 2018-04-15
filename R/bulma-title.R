#' Add subtitle
#'
#' @inheritParams bulmaPage
#' @param tag html tag.
#' @param id target to set an html anchor.
#'
#' @examples
#' if(interactive()){
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
#' }
#'
#' @author John Coene, \email{jcoenep@@gmail.com}
#' @rdname title
#' @export
bulmaTitle <- function(..., tag = shiny::h1, id = NULL){
  tag(
    class = "title", 
    id = id,
    ...
  )
}

#' @rdname title
#' @export
bulmaSubtitle <- function(..., tag = shiny::h2, id = NULL){
  tag(
    class = "subtitle",
    id = id,
    ...
  )
}
