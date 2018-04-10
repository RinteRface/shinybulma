#' @title bulma timeline
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a timeline container \url{https://wikiki.github.io/components/timeline/}.
#'
#' @param ... Slot for bulmaTimelineHeader and bulmaTimelineItem.
#' @param centered FALSE by default. Whether to center the timeline.
#' @param rtl FALSE by default. If rtl is TRUE, the timeline is displayed
#' right to left. If FALSE (and if centered is FALSE), the timeline is displayed
#' left to right (by default).
#'
#' @note known problem: when centered is TRUE, lines cannot be colored.
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
#'    # centered timeline
#'    bulmaTimeline(
#'     centered = TRUE,
#'     bulmaTimelineHeader(text = "Start", size = "medium", color = "primary"),
#'     bulmaTimelineItem(
#'       color = "primary", marker_color = "primary",
#'       marker_image = FALSE, marker_icon = FALSE,
#'       content_header = "January 2016", content_body = "Timeline content - Can include any HTML element"
#'     ),
#'     bulmaTimelineItem(
#'       color = "warning", marker_color = "warning",
#'       marker_image = TRUE, marker_image_size = "32x32", marker_icon = FALSE,
#'       content_header = "February 2016", content_body = "Timeline content - Can include any HTML element",
#'       tags$img(src = "http://bulma.io/images/placeholders/32x32.png")
#'     ),
#'     bulmaTimelineHeader(text = "2017", size = NULL, color = "primary"),
#'     bulmaTimelineItem(
#'       color = "danger", marker_color = "danger",
#'       marker_image = FALSE, marker_icon = TRUE,
#'       content_header = "March 2016", content_body = "Timeline content - Can include any HTML element",
#'       tags$i(class = "fa fa-flag")
#'     ),
#'     bulmaTimelineHeader(text = "End", size = "medium", color = "primary")
#'     )
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

bulmaTimeline <- function(..., centered = FALSE, rtl = FALSE) {

  cl <- "timeline"

  if (centered == TRUE) cl <- paste0(cl, " is-centered")
  if (rtl == TRUE) cl <- paste0(cl, " is-rtl")

  shiny::tags$div(
    class = cl,
    ...
  )
}


#' @title bulma timeline header
#'
#' @description Create a timeline header \url{https://wikiki.github.io/components/timeline/}.
#'
#' @param text Header name.
#' @param color Header color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param size Header size : \code{small},\code{medium} and \code{large}.
#'
#' @note you can insert any number of headers.
#'
#' @export
#'

bulmaTimelineHeader <- function(text = NULL, size = NULL, color = NULL) {

  cl <- "tag"

  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (!is.null(size)) cl <- paste0(cl, " is-", size)


  shiny::tags$header(
    class = "timeline-header",
    shiny::tags$span(
      class = cl,
      paste0(text)
    )
  )
}



#' @title bulma timeline item
#'
#' @description Create a timeline item \url{https://wikiki.github.io/components/timeline/}.
#'
#' @param ... Insert an icon or image here (if they are enabled via marker_image and
#' marker_icon, respectively) : \code{tags$i(class = "fa fa-flag")} or
#' \code{tags$img(src = "http://bulma.io/images/placeholders/32x32.png")}
#' @param color Plan color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param marker_color Item marker color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param marker_image TRUE or FALSE, FALSE by default. Whether to insert an image
#' in the marker.
#' @param marker_image_size image size.
#' @param marker_icon TRUE or FALSE, FALSE by default. Whether to insert an icon
#' in the marker.
#' @param content_header Content header.
#' @param content_body Item description.
#'
#'
#'
#' @details
#' Valid \code{size}:
#' \itemize{
#'   \item{16 - 16x16}
#'   \item{24 - 24x24}
#'   \item{32 - 32x32}
#'   \item{48 - 48x48}
#'   \item{54 - 54x54}
#'   \item{96 - 96x96}
#'   \item{128 - 128x128}
#' }
#'
#' @export
#'

bulmaTimelineItem <- function(..., color = NULL, marker_color = NULL,
                              marker_image = FALSE, marker_image_size = NULL,
                              marker_icon = FALSE, content_header = NULL,
                              content_body = NULL) {

  cl <- "timeline-item"

  if (!is.null(color)) cl <- paste0(cl, " is-", color)

  cl_marker <- "timeline-marker"

  if (!is.null(marker_color)) cl_marker <- paste0(cl_marker, " is-", marker_color)
  if (marker_image == TRUE) cl_marker <- paste0(cl_marker, " is-image")
  if (!is.null(marker_image_size)) cl_marker <- paste0(cl_marker, " is-", marker_image_size)
  if (marker_icon == TRUE) cl_marker <- paste0(cl_marker, " is-icon")

  shiny::tags$div(
    class = cl,
    shiny::tags$div(
      class = cl_marker,
      ...
    ),
    shiny::tags$div(
      class = "timeline-content",
      if (!is.null(content_header)) shiny::tags$p(class = "heading", content_header),
      if (!is.null(content_body)) shiny::tags$p(class = "heading", content_body)
    )
  )
}
