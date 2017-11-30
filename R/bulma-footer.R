#' Add a footer
#'
#' @inheritParams bulmaPage
#' @param centered wheter to center the text.
#'
#' @examples
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
#'
#' @export
bulmaFooter <- function(..., container = TRUE, centered = TRUE){

  cl <- "content"

  if(isTRUE(centered)) cl <- paste(cl, "has-text-centered")

  shiny::tags$footer(
    if(isTRUE(container)){
      tags$div(
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
