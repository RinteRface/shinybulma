#' @title bulma divider
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a vertical or horizontal divider \url{https://wikiki.github.io/layout/divider/}.
#'
#' @param content Content to display (In mathematical textbooks we usually find ***).
#' @param vertical TRUE or FALSE. Whether to use a vertical or horizontal divider.
#'
#' @note If vertical is TRUE, you need to wrap the divider in a bulmaColumns() configuration. See example below.
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
#'    # horizontal divider
#'    bulmaDivider(),
#'    # vertical divider need to be wrapped in columns!
#'    bulmaColumns(
#'     bulmaColumn(
#'       width = 6,
#'       bulmaBox(
#'          "test"
#'       )
#'     ),
#'     bulmaDivider(vertical = TRUE),
#'     bulmaColumn(
#'       width = 6,
#'       bulmaBox(
#'         "test"
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


bulmaDivider <- function(content = NULL, vertical = FALSE){
  if (vertical == FALSE) {
    shiny::tags$div(
      class = "is-divider", `data-content` = paste0(content)
    )
  } else {
    shiny::tags$div(
      class = "columns",
      shiny::tags$div(class = "column"),
      shiny::tags$div(
        class = "is-divider-vertical", `data-content` = paste0(content)
      ),
      shiny::tags$div(class = "column")
    )
  }
}
