#' Add subtitle
#'
#' @inheritParams bulmaPage
#' @param tag html tag.
#' @param id target to set an html anchor.
#' @param class A valid \code{CSS} class.
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
bulmaTitle <- function(..., class = NULL, tag = shiny::h1, id = NULL){
  
  cl <- paste0("title", class)
  
  tag(
    class = cl, 
    id = id,
    ...
  )
}

#' @rdname title
#' @export
bulmaSubtitle <- function(..., class = NULL, tag = shiny::h2, id = NULL){
  
  cl <- paste0("subtitle", class)
  
  tag(
    class = cl,
    id = id,
    ...
  )
}
