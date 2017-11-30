#' Add level
#'
#' Add levels
#'
#' @inheritParams bulmaPage
#' @param mobile set to \code{TRUE} if you want the level to be horizontal on mobile.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'     bulmaLevel(
#'       bulmaLevelItem("Tweets", "3'456"),
#'       bulmaLevelItem("Following", 765),
#'       bulmaLevelItem("Followers", "2'134")
#'     ),
#'     bulmaLevelOutput("levels")
#'   ),
#'   server = function(input, output) {
#'     output$levels <- renderBulmaLevel({
#'       bulmaLevel(
#'         bulmaLevelItem("Tweets", sample(100:5000, 1)),
#'         bulmaLevelItem("Following", sample(100:5000, 1)),
#'         bulmaLevelItem("Followers", sample(100:5000, 1))
#'       )
#'     })
#'   }
#' )
#'
#' @rdname level
#' @export
bulmaLevel <- function(..., mobile = FALSE){

  cl <- "level"

  if (isTRUE(mobile)) cl <- paste(cl, "is-mobile")

  shiny::tags$nav(
    class = cl,
    ...
  )
}

#' @rdname level
#' @export
bulmaLevelItem <- function(heading, value, centered = TRUE){

  if(missing(heading) | missing(value))
    stop("heading and title must be passed", call. = FALSE)

  cl <- "level-item"

  if(isTRUE(centered)) cl <- paste(cl, "has-text-centered")

  shiny::tags$div(
    class = cl,
    shiny::tags$div(
      tags$p(
        class = "heading",
        heading
      ),
      tags$p(
        class = "title",
        value
      )
    )
  )
}


#' @rdname level
#' @inheritParams shiny::renderUI
#' @export
renderBulmaLevel <- function(expr, env = parent.frame(), quoted = FALSE){

  fun <- shiny::exprToFunction(expr, env, quoted)

  shiny::renderUI({
    prog <- fun()
  })
}

#' @rdname level
#' @export
bulmaLevelOutput <- function(outputId){
  shiny::uiOutput(outputId)
}
