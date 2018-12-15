#' Button
#' 
#' Create a bulma button.
#' 
#' @param color a valid bulma color, i.e.: \code{white}, or \code{primary}.
#' @param display can be set to \code{fullwidth}.
#' @param style can be set to either \code{interted} or \code{outlined}.
#' @param size size of button, \code{small}, \code{medium}, or \code{large}.
#' @param rounded set to \code{TRUE} for a rounded button.
#' @param class additional CSS classes.
#' @param tag shiny tag to use.
#' @param ... button content.
#' 
#' @examples 
#' if(interactive()){
#'   library(shiny)
#'   
#'   ui <- bulmaPage(
#'     bulmaContainer(
#'       bulmaButton(
#'         "Button",
#'         color = "info",
#'         rounded = TRUE
#'       ),
#'       bulmaButton(
#'         "Outline",
#'         style = "outlined"
#'       )
#'     )
#'   )
#'   
#'   server <- function(input, output){}
#'   
#'   shinyApp(ui, server)
#' }
#' 
#' @export
bulmaButton <- function(..., color = NULL, style = NULL, class = NULL, rounded = FALSE, size = NULL, display = NULL, tag = shiny::tags$a){
  
  if(!is.null(color))
    color <- paste0("is-", color)
  
  if(!is.null(size))
    size <- paste0("is-", size)
  
  if(!is.null(display))
    display <- paste0("is-", display)
  
  if(!is.null(style))
    style <- paste0("is-", style)
  
  if(isTRUE(rounded))
    rounded <- "is-rounded"
  else
    rounded <- ""
    
  cl <- paste("button", color, size, display, class)
  
  tag(
    class = cl,
    ...
  )
  
}