#' Add tabs
#'
#' Add tabs
#'
#' @inheritParams bulmaPage
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
#' @author John Coene, \email{jcoenep@@gmail.com}
#' @rdname tabs
#' @export
bulmaTabs <- function(..., center = FALSE) {
  ## add a random tabset id to generate "unique" tab ids
  ## idea taken from tabsetPanel
  tabset_id <- sprintf("tab_%05d", sample(10000, 1))
  
  tabs <- list(...)
  
  tabs <- lapply(seq_along(tabs), function(idx) {
    tab <- tabs[[idx]]
    if (tagHasAttribute(tab, "id")) {
      warning("existing `id` attribute will be overwritten")
    }
    tab_id <- paste(tabset_id, idx, sep = "-")
    ## do not use tagAppendAttribute b/c we want to overwrite
    tab$attribs$id <- tab_id
    tab
  })
  
  links <- lapply(tabs, function(tab) {
    if (!tagHasAttribute(tab, "data-label")) {
      stop("tabs must contain an `data-label` attribute - ",
           "create tabs with `bulmaTab`")
    }
    label <- tagGetAttribute(tab, "data-label")
    tab_id <- tagGetAttribute(tab, "id")
    shiny::tags$li(
      shiny::tags$a(
        href = paste0("#", tab_id),
        label
      )
    )
  })
  
  tabs_header <- div(
    shiny::tags$ul(links),
    class = "tabs")
  
  if (center) {
    tabs_header <- tagAppendAttributes(
      tabs_header,
      class = "is-centered"
    )
  }
  
  shiny::tags$div(
    class = "bulmaTabs",
    tabs_header,
    tabs
  )
}

#' @rdname tabs
#' @export
bulmaTab <- function(label, ...){
  ## add label as custom `data-label` field to the div
  ## this label can then be reused in bulmaTabs
  shiny::tags$div(
    class = "bulmaTab",
    `data-label` = label,
    ...
  )
}
