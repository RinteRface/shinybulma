#' Create a bulma app
#'
#' Build a bulma Shiny app.
#'
#' @param ... any element.
#' @param title page title.
#' @param theme a theme.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' 
#' shiny::shinyApp(
#'   ui = bulmaNavbarPage(
#'    bulmaNavbar(
#'      bulmaNavbarBrand(
#'        bulmaNavbarItem(
#'          "shinybulma"
#'        ),
#'        bulmaNavbarBurger()
#'      ),
#'      bulmaNavbarMenu( # not visible on smaller devices
#'        bulmaNavbarItem(
#'          "Item 1"
#'        ),
#'        bulmaNavbarItem(
#'          "Item 2"
#'        ),
#'      bulmaNavbarDropdown(
#'        label = "Drop-down",
#'        bulmaNavbarItem(
#'          "Select 1"
#'        ),
#'        bulmaNavbarItem(
#'          "Select 2"
#'        )
#'      )
#'     )
#'    ),
#'    bulmaNav(
#'      "Item 1",
#'      bulmaTitle("Content for item 1 here.")
#'    ),
#'    bulmaNav(
#'      "Item 2",
#'      bulmaTitle("Content for item 2 here.")
#'    )
#'   ),
#'   server = function(input, output) {}
#' )
#' }
#' 
#' @author John Coene, \email{jcoenep@@gmail.com}
#'
#' @rdname page
#' @export
bulmaPage <- function(..., title = NULL, theme = "default"){
  
  if(!theme %in% bulma_themes())
    stop("wrong theme", call. = FALSE)

  shiny::tagList(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      shiny::tags$meta(charset = "utf-8"),
      shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
      shiny::tags$title(title)
    ),
    # Body --------------------------------------------------------------------
    addDeps(shiny::tagList(...), theme = theme)
  )
}

#' @rdname page
#' @export
bulmaNavbarPage <- bulmaPage