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
#'      "Item 2",
#'      bulmaContainer(
#'        bulmaTitle("Item 2"),
#'        plotOutput("hist")
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
#'   }
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

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-nav-js.js"), package = "shinybulma")
        )
      )
    ),
    nav
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

  id <- gsub("[[:space:]]|[[:cntrl:]]|[[:punct:]]", "-", label)
  id <- paste0(id, "button")


  item <- shiny::tags$a(
    id = id,
    class = "navbar-item",
    href = href,
    label
  )

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::tags$script(
          paste0('$(document).ready(function(){
                 $("#', id,'").click(function(){
                     $("', href,'").show().siblings("div").hide();
                     $("', href,'").addClass("active");
                     $("', href,'").css( "display", "block" );
                 })
                ;});')
        )
      )
    ),
    item
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

  burger <- shiny::tags$button(
    class = "button navbar-burger",
    `data-target` = "navMenu",
    shiny::tags$span(),
    shiny::tags$span(),
    shiny::tags$span()
  )

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-burger-js.js"), package = "shinybulma")
        )
      )
    ),
    burger
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
    class = "navTab",
    style = "display:none",
    ...
  )
}
