#' Add a section
#'
#' Add a container to divide your page into sections
#'
#' @inheritParams bulmaPage
#' @param size change the spacing, takes \code{medium} or \code{large}.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaSection(
#'      size = "large",
#'      bulmaContainer(
#'       bulmaTitle("Section 1 title"),
#'       bulmaSubtitle("Section 1 subtitle")
#'      )
#'    ),
#'    bulmaSection(
#'      bulmaContainer(
#'       bulmaTitle("Section 1 title"),
#'       bulmaSubtitle("Section 1 subtitle")
#'      )
#'    )
#'   ),
#'   server = function(input, output) {}
#' )
#' }
#'
#' @author John Coene, \email{jcoenep@@gmail.com}
#' @export
bulmaSection <- function(..., size = NULL){
  cl <- "section"

  if(!is.null(size)) cl <- paste0(cl, " is-", size)

  shiny::tags$section(
    class = cl,
    ...
  )
}
