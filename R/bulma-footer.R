#' Add a footer
#'
#' Add footer
#'
#' @inheritParams bulmaPage
#' @param container set to \code{TRUE} to wrap in \code{\link{bulmaContainer}}.
#' @param centered wheter to center the text.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' ui <- bulmaPage(
#'   bulmaHero(
#'     fullheight = TRUE,
#'     color = "primary",
#'     bulmaHeroHead(
#'       bulmaContainer(
#'         bulmaTitle("Hero Title")
#'       )
#'     ),
#'     bulmaHeroHead(
#'       bulmaContainer(
#'         bulmaSubtitle(
#'           "Some content"
#'         )
#'       )
#'     ),
#'     bulmaHeroFoot(
#'       bulmaContainer(
#'         "The footer"
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
#' @export
bulmaFooter <- function(..., container = TRUE, centered = TRUE){

  cl <- "content"

  if(isTRUE(centered)) cl <- paste(cl, "has-text-centered")

  shiny::tags$footer(
    if(isTRUE(container)){
      shiny::tags$div(
        class = "container",
        shiny::tags$div(
          class = cl,
          ...
        )
      )
    } else {
      shiny::tags$div(
        class = cl,
        ...
      )
    }
  )
}
