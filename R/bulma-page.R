#' Create a bulma app
#'
#' Build a bulma Shiny app.
#'
#' @param ... any element.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
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
#'
#' @rdname page
#' @export
bulmaPage <- function(...){

  bulma_page(...)
}

#' @rdname page
#' @export
bulmaNavbarPage <- bulmaPage
