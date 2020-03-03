#' Add a section
#'
#' Add a container to divide your page into sections
#'
#' @inheritParams bulmaPage
#' @param size change the spacing, takes \code{medium} or \code{large}.
#' @param container If \code{TRUE} wraps a \code{\link{bulmaContainer}} as a children of the section.
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
bulmaSection <- function(..., container = TRUE, size = NULL){
  cl <- "section"

  if(!is.null(size)) cl <- paste0(cl, " is-", size)
  
  if(isTRUE(container)){
    shiny::tags$section(
      class = cl,
      shiny::div(
        class = "container",
        ...
      )
    )
  } else {
    shiny::tags$section(
      class = cl,
      ...
    )
  }
  
}
