#' @title bulma steps
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a step element \url{https://wikiki.github.io/components/steps/}.
#'
#' @param ... Slot for bulmaStepItem.
#' @param size Global size : \code{small},\code{medium} and \code{large}.
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
#'    bulmaSteps(
#'     size = NULL,
#'     bulmaStepItem(
#'       color = "success", completed = TRUE, active = FALSE,
#'       bulmaStepDetail(
#'         color = NULL, completed = FALSE, title = "Step 1", marker = 1,
#'         "This is the first step of the process."
#'       )
#'     ),
#'     bulmaStepItem(
#'       color = NULL, completed = FALSE, active = FALSE,
#'       bulmaStepDetail(
#'         color = NULL, completed = FALSE, title = "Step 2", marker = NULL,
#'         "This is the second step. You get here once you have completed the first step."
#'       )
#'     ),
#'     bulmaStepItem(
#'       color = NULL, completed = FALSE, active = FALSE,
#'       bulmaStepDetail(
#'         color = NULL, completed = FALSE, title = "Step 3", marker = 3,
#'         "This is the third step. One more step before the end."
#'       )
#'     ),
#'     bulmaStepItem(
#'       color = NULL, completed = FALSE, active = TRUE,
#'       bulmaStepDetail(
#'         color = NULL, completed = FALSE, title = "Step 4", marker = NULL,
#'         "Final step. You have completed all the previous steps and end the process."
#'       )
#'     )
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

bulmaSteps <- function(..., size = NULL) {

  cl <- "steps"

  if (!is.null(size)) cl <- paste0(cl, " is-", size)

  shiny::tags$ul(
    class = cl,
    ...
  )
}


#' @title bulma Step item
#'
#' @description Create a step item to insert in bulmaSteps \url{https://wikiki.github.io/components/steps/}.
#'
#' @param ... Slot for bulmaStepDetail.
#' @param color Plan color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param completed TRUE or FALSE. Is the current step completed or not?
#' @param active TRUE or FALSE. Is the current step active or not?
#'
#' @export
#'
bulmaStepItem <- function(..., color = NULL, completed = FALSE, active = FALSE) {

  cl <- "step-item"

  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (completed == TRUE) cl <- paste0(cl, " is-completed")
  if (active == TRUE) cl <- paste0(cl, " is-active")

  shiny::tags$li(
    class = cl,
    ...
  )
}


#' @title bulma step detail
#'
#' @description Create a step detail to insert in a bulmaStepItem \url{https://wikiki.github.io/components/steps/}.
#'
#' @param ... Description of the step.
#' @param color Step color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param completed TRUE or FALSE. Is the current step completed or not?
#' @param title Step title.
#' @param marker Whether to put a marker in the round circle.
#'
#' @export
#'

bulmaStepDetail <- function(..., color = NULL, completed = FALSE,
                            title = NULL, marker = NULL) {

  cl <- "step-details"

  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (completed == TRUE) cl <- paste0(cl, " is-completed")

  tagList(
    shiny::tags$div(
      class = "step-marker",
      if (!is.null(marker)) paste0(marker)
    ),

    shiny::tags$div(
      class = cl,
      if (!is.null(title)) shiny::tags$p(class = "step-title", paste0(title)),
      shiny::tags$p(
        ...
      )
    )
  )
}
