#' Add navbar
#'
#' Add a responsive horizontal navbar.
#'
#' @inheritParams bulmaPage
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaNavbar(
#'      fix.top = TRUE,
#'      color = "primary",
#'      bulmaNavbarBrand(
#'        bulmaNavbarItem(
#'          "shinybulma"
#'        ),
#'        bulmaNavbarBurger()
#'      ),
#'      bulmaNavbarMenu( # not visible on smaller devices
#'        bulmaNavbarItem(
#'          "Item  1"
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
#'      )
#'    )
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @rdname navbar
#' @export
bulmaNavbar <- function(..., transparent = FALSE, color = NULL, fix.top = FALSE, fix.bottom = FALSE){

  if(isTRUE(fix.top) && isTRUE(fix.bottom))
    stop("Can only fix navbar to top or bottom, not both", call. = FALSE)

  cl <- "navbar"

  if(isTRUE(transparent)) cl <- paste(cl, "is-transparent")
  if(!is.null(color)) cl <- paste0(cl, " is-", color)
  if(isTRUE(fix.top)) cl <- paste(cl, "is-fixed-top")
  if(isTRUE(fix.bottom)) cl <- paste(cl, "is-fixed-bottom")

  nav <- shiny::tags$nav(
    class = cl,
    role = "navigation",
    `aria-label` = "main navigation",
    ...
  )

  if(isTRUE(fix.top) || isTRUE(fix.bottom)){
    x <- ifelse(isTRUE(fix.top), "top", "bottom")
    addClass <- paste0('var d = document.getElementById("shinybulma-html"); d.className += " has-navbar-fixed-', x,
                       '";')

    nav <- shiny::tagAppendChild(nav, shiny::tags$script(addClass))
  }

  nav
}

#' @rdname navbar
#' @export
bulmaNavbarBrand <- function(...){
  shiny::tags$div(
    class = "navbar-brand",
    ...
  )
}

#' @rdname navbar
#' @export
bulmaNavbarMenu <- function(...){
  shiny::tags$div(
    id = "navMenu",
    class = "navbar-menu",
    ...
  )
}

#' @rdname navbar
#' @export
bulmaNavbarItem <- function(..., href = ""){
  shiny::tags$a(
    class = "navbar-item",
    href = href,
    ...
  )
}

#' @rdname navbar
#' @export
bulmaNavbarLink <- function(..., href = ""){
  shiny::tags$a(
    class = "navbar-link",
    href = href,
    ...
  )
}

#' @rdname navbar
#' @export
bulmaNavbarBurger <- function(){
  shiny::tags$button(
    class = "button navbar-burger",
    `data-target` = "navMenu",
    shiny::tags$span(),
    shiny::tags$span(),
    shiny::tags$span()
  )
}

#' @rdname navbar
#' @export
bulmaNavbarDropdown <- function(..., label, href = ""){
  shiny::tags$div(
    class = "navbar-item has-dropdown is-hoverable",
    shiny::tags$a(
      class = "navbar-link",
      href = href,
      label
    ),
    shiny::tags$div(
      class = "navbar-dropdown is-boxed",
      ...
    )
  )
}
