#' @title bulma Button Badge
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a button with a badge \url{https://wikiki.github.io/elements/badge/}.
#'
#' @param label button label.
#' @param url The url of the button.
#' @param color Color of the button : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param style Style of the button :  \code{outlined}.
#' @param loading if the button is loading or not.
#' @param size Size of the button : \code{small},\code{medium} and \code{large}.
#' @param badge_color Color of the button : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param badge_size Size of the button : \code{small},\code{medium} and \code{large}.
#' @param badge_style Style of the button :  \code{outlined}.
#' @param badge_position Position of the badge : \code{left}, \code{bottom-left} and \code{bottom}. Right by default.
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
#'   bulmaContainer(
#'    bulmaColumns(
#'    bulmaColumn(
#'     width = 2,
#'     bulmaButtonBadge(label = "test",
#'                      url = "http://google.com", color = "danger", style = NULL, loading = FALSE,
#'                      size = NULL, badge_color = "warning", badge_style = NULL,
#'                      badge_size = NULL, badge_position = NULL, badge_text = 1
#'     ),
#'     br(), br(),
#'
#'     bulmaButtonBadge(label = "test",
#'                      url = NULL, color = "warning", style = "outlined", loading = FALSE,
#'                      size = "small", badge_color = "info", badge_style = NULL,
#'                      badge_size = NULL, badge_position = NULL, badge_text = 2
#'     ),
#'     br(), br(),
#'
#'     bulmaButtonBadge(label = "test",
#'                      url = NULL, color = "success", style = NULL, loading = FALSE,
#'                      size = "medium", badge_color = "danger", badge_style = NULL,
#'                      badge_size = NULL, badge_position = NULL, badge_text = 3
#'     )
#'     ),
#'     bulmaColumn(
#'       width = 2,
#'       bulmaButtonBadge(label = "test",
#'                        url = NULL, color = "black", style = "outlined", loading = FALSE,
#'                        size = "large", badge_color = NULL, badge_style = NULL,
#'                        badge_size = NULL, badge_position = NULL, badge_text = 4
#'       ),
#'       br(), br(),
#'
#'       bulmaButtonBadge(label = "test",
#'                        url = NULL, color = "info", style = NULL, loading = FALSE,
#'                        size = NULL, badge_color = "success", badge_style = NULL,
#'                        badge_size = "small", badge_position = NULL, badge_text = 5
#'       ),
#'       br(), br(),
#'
#'       bulmaButtonBadge(label = "test",
#'                        url = NULL, color = NULL, style = "outlined", loading = FALSE,
#'                        size = NULL, badge_color = "warning", badge_style = NULL,
#'                        badge_size = "medium", badge_position = "left", badge_text = 6
#'       )
#'     ),
#'     bulmaColumn(
#'       width = 2,
#'       bulmaButtonBadge(label = "test",
#'                        url = NULL, color = NULL, style = "primary", loading = TRUE,
#'                        size = NULL, badge_color = NULL, badge_style = "outlined",
#'                        badge_size = "large", badge_position = "botton", badge_text = NULL
#'       )
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


bulmaButtonBadge <- function(label = NULL, url = NULL, color = NULL, style = NULL, loading = FALSE,
                             size = NULL, badge_color = NULL, badge_style = NULL,
                             badge_size = NULL, badge_position = NULL, badge_text = NULL) {

  cl <- "button badge"

  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (!is.null(style)) cl <- paste0(cl, " is-", style)
  if (!is.null(size)) cl <- paste0(cl, " is-", size)
  if (loading == TRUE) cl <- paste0(cl, " is-loading")

  if (!is.null(badge_color)) cl <- paste0(cl, " is-badge-", badge_color)
  if (!is.null(badge_style)) cl <- paste0(cl, " is-badge-", badge_style)
  if (!is.null(badge_position)) cl <- paste0(cl, " is-badge-", badge_position)
  if (!is.null(badge_size)) cl <- paste0(cl, " is-badge-", badge_size)


  shiny::tags$button(
    class = cl,
    `data-badge` = badge_text,
    shiny::tags$a(href = url, target = "_blank", label)
  )

}
