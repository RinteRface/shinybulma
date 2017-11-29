#' Create a bulma app
#'
#' Build a bulma Shiny app.
#'
#' @param ... any page element.
#'
#' @export
bulma_page <- function(...){

  shiny::tags$html(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      shiny::tags$meta(
        charset = "utf-8"
      ),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1"
      ),
      shiny::includeCSS(
        system.file("css/bulma.min.css",
                    package = "shinybulma")
      )
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(...)
  )
}
