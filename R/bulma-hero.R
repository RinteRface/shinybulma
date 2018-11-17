#' Add section
#'
#' Add a section tag.
#'
#' @inheritParams bulmaPage
#' @param color hero color.
#' @param size hero size takes \code{NULL}, \code{medium} or \code{large}.
#' @param bold set to \code{TRUE} to generate a subtle gradient.
#' @param fullheight set to \code{TRUE} to set hero to \code{100vh}.
#' @param container If \code{TRUE} wraps a \code{\link{bulmaContainer}} as a children of the section.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' ui <- bulmaPage(
#'   bulmaHero(
#'     fullheight = TRUE,
#'     color = "danger",
#'     bulmaHeroBody(
#'       bulmaContainer(
#'         bulmaTitle("Hello Bulma*"),
#'         bulmaSubtitle("shinybulma*")
#'       )
#'     )
#'   )
#' )
#'
#' server <- function(input, output){}
#'
#' shinyApp(ui, server)
#' }
#' 
#' @author John Coene, \email{jcoenep@@gmail.com}
#' @rdname hero
#' @export
bulmaHero <- function(..., color = NULL, size = NULL, bold = FALSE,
                      fullheight = FALSE){

  cl <- "hero"

  if(!is.null(color)) cl <- paste0(cl, " is-", color)
  if(!is.null(size)) cl <- paste0(cl, " is-", size)
  if(isTRUE(bold)) cl <- paste(cl, "is-bold")
  if(isTRUE(fullheight)) cl <- paste(cl, "is-fullheight")

  shiny::tags$section(
    class = cl,
    ...
  )
  
}

#' @rdname hero
#' @export
bulmaHeroHead <- function(...){
  shiny::tags$div(
    class = "hero-head",
    ...
  )
}

#' @rdname hero
#' @export
bulmaHeroBody <- function(..., container = TRUE){
  if(isTRUE(container)){
    shiny::div(
      class = "hero-body",
      shiny::div(
        class = "container",
        ...
      )
    )
  } else {
    shiny::tags$div(
      class = "hero-body",
      ...
    )
  }
}

#' @rdname hero
#' @export
bulmaHeroFoot <- function(...){
  shiny::tags$div(
    class = "hero-foot",
    ...
  )
}
