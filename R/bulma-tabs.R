#' Add tabs
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaTabs(
#'      tabs = c("Tab 1", "Tab 2", "Tab 3"),
#'      center = TRUE,
#'      bulmaTab(
#'        "Tab 1",
#'        "Content of the first Tab."
#'      ),
#'      bulmaTab(
#'        "Tab 2",
#'        "Content of the second Tab."
#'      ),
#'      bulmaTab(
#'        "Tab 3",
#'        "Content of the third Tab."
#'      )
#'    )
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @rdname tabs
#' @export
bulmaTabs <- function(tabs, center = FALSE, ...){

  list <- shiny::tags$ul()

  for(tab in tabs){
    list <- shiny::tagAppendChild(list, shiny::tags$li(
      shiny::tags$a(
        href = paste0("#", gsub("[[:cntrl:]]|[[:punct:]]|[[:space:]]", "-", tab)),
        tab
      )
    ))
  }

  cl <- "tabs"
  if(isTRUE(center)) cl <- paste(cl, "is-centered")

  cmb <- shiny::tags$div(
    class = "bulma-tabs",
    shiny::tags$div(
      list,
      class = cl
    ),
    ...
  )

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-tabs-js.js"), package = "shinybulma")
        )
      )
    ),
    cmb
  )
}

#' Add tab
#'
#' @rdname tabs
#' @export
bulmaTab <- function(label, ...){

  id <- gsub("[[:cntrl:]]|[[:punct:]]|[[:space:]]", "-", label)

  shiny::tags$div(
    id = id,
    ...
  )
}
