#' Add navbar
#'
#' Add a responsive horizontal navbar.
#'
#' @inheritParams bulmaPage
#' @param transparent set to have transparent.
#' @param color navbar color.
#' @param fix.top,fix.bottom set one to have navbar fixed at top or bottom of page.
#' @param label item label.
#' @param href,target id of \code{bulmaNav} linked, \code{href} and \code{target} must be identical.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaNavbar(
#'      color = "primary",
#'      bulmaNavbarBrand(
#'        bulmaNavbarItem(
#'          "shinybulma",
#'          href = "Item 1"
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
#'        bulmaNavbarItem(
#'          "Item 3"
#'        )
#'     )
#'    ),
#'    bulmaNav(
#'      "Item 1",
#'      bulmaContainer(
#'        bulmaTitle("Item 1"),
#'        bulmaTabs(
#'        tabs = c("Tab 1", "Tab 2", "Tab 3"),
#'        center = TRUE,
#'          bulmaTab(
#'            "Tab 1",
#'            bulmaTitle("Tab 1")
#'          ),
#'          bulmaTab(
#'            "Tab 2",
#'            bulmaTitle("Tab 2"),
#'            plotOutput("hist")
#'          ),
#'          bulmaTab(
#'            "Tab 3",
#'            bulmaTitle("Tab 3")
#'          )
#'        )
#'      )
#'    ),
#'    bulmaNav(
#'      "Item 2",
#'      bulmaContainer(
#'        bulmaTitle("Item 2"),
#'        plotOutput("plot2"),
#'        bulmaTabs(
#'        tabs = c("Tab 1", "Tab 2", "Tab 3"),
#'        center = TRUE,
#'          bulmaTab(
#'            "Tab 1",
#'            bulmaTitle("Tab 1")
#'          ),
#'          bulmaTab(
#'            "Tab 2",
#'            bulmaTitle("Tab 2"),
#'            plotOutput("plot")
#'          ),
#'          bulmaTab(
#'            "Tab 3",
#'            bulmaTitle("Tab 3")
#'          )
#'        )
#'      )
#'    ),
#'    bulmaNav(
#'      "Item 3",
#'      bulmaContainer(
#'        bulmaTitle("Item 3")
#'      )
#'    )
#'   ),
#'   server = function(input, output) {
#'     output$hist <- renderPlot({
#'       hist(rnorm(20, 10))
#'     })
#'     output$plot <- renderPlot({
#'       plot(1:20, rnorm(20, 20))
#'     })
#'     
#'     output$plot2 <- renderPlot({
#'       plot(1:20, rnorm(20, 20))
#'     })
#'   }
#' )
#' }
#'
#' @author John Coene, \email{jcoenep@@gmail.com}
#' @rdname navbar
#' @export
bulmaNavbar <- function(..., transparent = FALSE, color = NULL, fix.top = FALSE, 
                        fix.bottom = FALSE){

  if(isTRUE(fix.top) && isTRUE(fix.bottom))
    stop("Can only fix navbar to top or bottom, not both", call. = FALSE)

  cl <- "navbar"
  
  if(isTRUE(start) && isTRUE(end))
    stop("can only set start or end to TRUE, not both", call. = FALSE)

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

  return(nav)
}

#' @rdname navbar
#' @export
bulmaNavbarStart <- function(...){
  shiny::tags$div(
    class = "navbar-start",
    ...
  )
}

#' @rdname navbar
#' @export
bulmaNavbarEnd <- function(...){
  shiny::tags$div(
    class = "navbar-end",
    ...
  )
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
bulmaNavbarItem <- function(label, href = NULL){

  if(is.null(href)){
    href <- gsub("[[:space:]]|[[:cntrl:]]|[[:punct:]]", "-", label)
    href <- paste0("#", href)
  }

  fct <- paste0("showHide('", href, "')") # bulma-nav-js.js
  
  shiny::tags$a(
    class = "navbar-item",
    onclick = fct,
    label
  )

}

#' @rdname navbar
#' @export
bulmaNavbarLink <- function(label, href = ""){
  shiny::tags$a(
    class = "navbar-link",
    href = href,
    label
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

#' @rdname navbar
#' @export
bulmaNav <- function(target, ...){

  target <- gsub("[[:space:]]|[[:cntrl:]]|[[:punct:]]", "-", target)

  shiny::tags$div(
    id = target,
    style = "display: none;", # plots do not render
    class = "navTab",
    ...
  )
}
