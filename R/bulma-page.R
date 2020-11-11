#' Create a bulma app
#'
#' Build a bulma Shiny app.
#'
#' @param ... any element.
#' @param title page title.
#' @param theme a theme.
#' 
#' @section Themes:
#' You can preview all themes at \url{https://jenil.github.io/bulmaswatch/}.
#' \itemize{
#'  \item{\code{cerulean}}
#'  \item{\code{cyborg}}
#'  \item{\code{cosmo}}
#'  \item{\code{dark}}
#'  \item{\code{darly}}
#'  \item{\code{flatly}}
#'  \item{\code{journal}}
#'  \item{\code{default}}
#'  \item{\code{litera}}
#'  \item{\code{lumen}}
#'  \item{\code{lux}}
#'  \item{\code{materia}}
#'  \item{\code{minty}}
#'  \item{\code{nuclear}}
#'  \item{\code{pulse}}
#'  \item{\code{sansdstone}}
#'  \item{\code{simplex}}
#'  \item{\code{slate}}
#'  \item{\code{solar}}
#'  \item{\code{spacelab}}
#'  \item{\code{superhero}}
#'  \item{\code{united}}
#'  \item{\code{yeti}}
#' }
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
    add_bulma_deps(shiny::tagList(...), theme = theme)
  )
}

#' @rdname page
#' @export
bulmaNavbarPage <- bulmaPage