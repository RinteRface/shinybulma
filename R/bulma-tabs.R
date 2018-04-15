#' Add tabs
#'
#' Add tabs
#'
#' @inheritParams bulmaPage
#' @param tabs \code{bulmaTab} elements.
#' @param center set to center.
#' @param label label of tab.
#'
#' @examples
#' if(interactive()){
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
#'        plotOutput("hist")
#'      ),
#'      bulmaTab(
#'        "Tab 3",
#'        bulmaContainer(
#'          bulmaTitle("Plot"),
#'          plotOutput("plot")
#'        )
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
#' }
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
    class = "bulmaTabs",
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
