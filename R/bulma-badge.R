#' @title bulma badge components
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a badge to highlight a given element \url{https://wikiki.github.io/elements/badge/}.
#'
#' @param ... Any element where the badge will be stuck.
#' @param color Badge color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param size Badge size : \code{small}, \code{medium} and \code{large}.
#' @param style Badge style :  \code{outlined}. NULL by default
#' @param position Badge position : \code{left}, \code{bottom-left} and \code{bottom}. When NULL, it is displayed on the right side by default.
#' @param badge_text Badge content : avoid too large content (a number is better).
#'
#' @export
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'  library(shiny)
#'
#'  ui <- bulmaPage(
#'  bulmaContainer(
#'  br(), br(),
#'  bulmaColumns(
#'   bulmaColumn(
#'    width = 2,
#'    bulmaBadge(
#'     "test",
#'     position = "",
#'     size = NULL,
#'     style = NULL,
#'     color = NULL,
#'     badge_text = 3
#'    ),
#'
#'    br(), br(),
#'
#'    bulmaBadge(
#'      "test",
#'      position = "bottom",
#'      size = NULL,
#'      style = NULL,
#'      color = NULL,
#'      badge_text = 3
#'    ),
#'
#'    br(), br(),
#'
#'    bulmaBadge(
#'      "test",
#'      position = "bottom-left",
#'      size = NULL,
#'      style = NULL,
#'      color = NULL,
#'      badge_text = 3
#'    )
#'    ),
#'    bulmaColumn(
#'      width = 2,
#'      bulmaBadge(
#'        "test",
#'        position = NULL,
#'        size = "small",
#'        style = NULL,
#'        color = NULL,
#'        badge_text = 3
#'      ),
#'
#'      br(), br(),
#'
#'      bulmaBadge(
#'        "test",
#'        position = NULL,
#'        size = "medium",
#'        style = NULL,
#'        color = NULL,
#'        badge_text = 3
#'      ),
#'
#'      br(), br(),
#'
#'      bulmaBadge(
#'        "test",
#'        position = NULL,
#'        size = "large",
#'        style = NULL,
#'        color = NULL,
#'        badge_text = 3
#'      )
#'    ),
#'    bulmaColumn(
#'      width = 2,
#'      bulmaBadge(
#'        "test",
#'        position = NULL,
#'        size = NULL,
#'        style = "outlined",
#'        color = "info",
#'        badge_text = 3
#'      ),
#'
#'      br(), br(),
#'
#'      bulmaBadge(
#'        "test",
#'        position = NULL,
#'        size = NULL,
#'        style = NULL,
#'        color = "warning",
#'        badge_text = 3
#'      ),
#'
#'      br(), br(),
#'
#'      bulmaBadge(
#'        "test",
#'        position = NULL,
#'        size = NULL,
#'        style = NULL,
#'        color = "danger",
#'        badge_text = 3
#'      ),
#'
#'      br(), br(),
#'
#'      bulmaBadge(
#'        "test",
#'        position = NULL,
#'        size = NULL,
#'        style = NULL,
#'        color = "success",
#'        badge_text = 3
#'      )
#'     )
#'    )
#'   )
#'  )
#'
#'  server <- function(input, output, session) {
#'
#'  }
#'
#'  shinyApp(ui = ui, server = server)
#'
#' }
#' }


bulmaBadge <- function(..., color = NULL, size = NULL, style = NULL,
                       position = NULL, badge_text = NULL){

  cl <- "badge"

  if (!is.null(color)) cl <- paste0(cl, " is-badge-", color)
  if (!is.null(size)) cl <- paste0(cl, " is-badge-", size)
  if (!is.null(style)) cl <- paste0(cl, " is-badge-", style)
  if (!is.null(position)) cl <- paste0(cl, " is-badge-", position)

  shiny::tags$span(
    class = cl, `data-badge` = if (!is.null(badge_text))  paste0(badge_text) ,
    ...
  )
}
