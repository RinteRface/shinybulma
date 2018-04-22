#' Create a bulma app
#'
#' Build a bulma Shiny app.
#'
#' @param ... any element.
#'
#' @examples
#' if(interactive()){
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
#' @rdname page
#' @export
bulmaPage <- function(...){

  shiny::tagList(
    # Head --------------------------------------------------------------------
    shiny::tags$head(
      shiny::tags$meta(charset = "utf-8"),
      shiny::tags$meta(name = "viewport", content = "width=device-width, initial-scale=1"),
      shiny::tags$link(
        rel = "stylesheet", 
        href = "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      ),
      shiny::tags$script(
        `defer` = NA,
        src = "https://use.fontawesome.com/releases/v5.0.7/js/all.js"
      ),
      shiny::includeCSS(
        system.file("css", "bulma.min.css", package = "shinybulma")
      ),
      shiny::includeCSS(
        system.file("css", "bulma-tooltip.min.css", package = "shinybulma")
      ),
      shiny::includeCSS(
        system.file("css", "bulma-extensions.min.css", package = "shinybulma")
      ),
      # shiny::includeScript(
      #   system.file("js", "jquery.min.js", package = "shinybulma")
      # ),
      shiny::includeScript(
        system.file("js", "jquery-ui.min.js", package = "shinybulma")
      ),
      shiny::includeScript(
        system.file("js", "bulma-carousel.min.js", package = "shinybulma")
      ),
      shiny::includeScript(
        system.file("js", "bulma-steps.min.js", package = "shinybulma")
      ),
      shiny::includeScript(
        system.file("js", "custom-js.js", package = "shinybulma")
      )
    ),
    # Body --------------------------------------------------------------------
    ...
  )
}

#' @rdname page
#' @export
bulmaNavbarPage <- bulmaPage