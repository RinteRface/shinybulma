#' Add a column
#'
#' @inheritParams bulmaPage
#' @param gapless if \code{TRUE} remove gaps between columns.
#' @param centered to center columns.
#' @param mobile,tablet,desktop set to force columns on device.
#' @param multiline to create a flexible, centered list.
#' 
#' @examples 
#' if(interactive()){
#' ui <- bulmaPage(
#'   bulmaContainer(
#'     bulmaColumns(
#'       bulmaColumn(
#'         bulmaTitle("2 columns")
#'       ),
#'       bulmaColumn(
#'         plotOutput("plot")
#'       )
#'     )
#'   )
#' )
#' 
#' server <- function(input, output){
#'   output$plot <- renderPlot({
#'     plot(1:20, rnorm(20), type = "l")
#'   })
#' }
#' 
#' shiny::shinyApp(ui, server)
#' }
#' @author John Coene, \email{jcoenep@@gmail.com}
#'
#' @seealso \code{\link{bulmaColumn}}
#'
#' @export
bulmaColumns <- function(..., gapless = FALSE, centered = FALSE, multiline = FALSE, mobile = FALSE, tablet = FALSE,
                         desktop = FALSE){

  cl <- "columns"

  if(isTRUE(gapless)) cl <- paste(cl, "is-gapless")
  if(isTRUE(tablet)) cl <- paste(cl, "is-tablet")
  if(isTRUE(desktop)) cl <- paste(cl, "is-desktop")
  if(isTRUE(mobile)) cl <- paste(cl, "is-mobile")
  if(isTRUE(centered)) cl <- paste(cl, "is-centered")
  if(isTRUE(multiline)) cl <- paste(cl, "is-multiline")

  shiny::tags$div(
    class = cl,
    ...
  )
}

#' Add a column
#'
#' @inheritParams bulmaPage
#' @param width width of column (12-column system).
#' @param narrow use for column to only take the space it needs.
#'
#' @author John Coene, \email{jcoenep@@ymail.com}
#' 
#' @seealso \code{\link{bulmaColumn}}
#'
#' @export
bulmaColumn <- function(..., width = NULL, narrow = FALSE){

  cl <- "column"

  if(!is.null(width)) cl <- paste0(cl, " is-", width)
  if(isTRUE(narrow)) cl <- paste(cl, "is-narrow")

  shiny::tags$div(
    class = cl,
    ...
  )
}
