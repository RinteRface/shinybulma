#' Create a bulma app
#'
#' Build a bulma Shiny app.
#'
#' @param ... any element.
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
bulmaPage <- function(..., theme = "default"){
  
  if(!theme %in% bulma_themes())
    stop("wrong theme", call. = FALSE)

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
      shiny::tags$link(
        rel = "stylesheet",
        text = "text/css",
        src = "bulmacss/bulma.min.css"
      ),
      shiny::tags$link(
        rel = "stylesheet",
        text = "text/css",
        src = "bulmacss/bulma-tooltip.min.css"
      ),
      shiny::tags$link(
        rel = "stylesheet",
        text = "text/css",
        href = paste0("bulmathemes/css/", tolower(theme), ".min.css")
      ),
      shiny::tags$link(
        rel = "stylesheet",
        text = "text/css",
        src = "bulmacss/bulma-extensions.min.css"
      ),
      shiny::tags$script(
        src = "bulmajs/jquery-ui.min.js"
      ),
      shiny::tags$script(
        src = "bulmajs/bulma-carousel.min.js"
      ),
      shiny::tags$script(
        src = "bulmajs/bulma-steps.min.js"
      ),
      shiny::tags$script(
        src = "bulmajs/custom-js.js"
      )
    ),
    # Body --------------------------------------------------------------------
    ...
  )
}

#' @rdname page
#' @export
bulmaNavbarPage <- bulmaPage