#' Icons
#' 
#' Add icons.
#' 
#' @param icon Fontawesome icon class.
#' @param color color of icon.
#' @param size size of icon.
#' 
#' @examples 
#' if(interactive()){
#'   library(shiny)
#'   
#'   ui <- bulmaPage(
#'     bulmaContainer(
#'       bulmaIcon(
#'         "fa fa-info",
#'         color = "info"
#'       ),
#'       bulmaButton(
#'         bulmaIcon("fa fa-home"),
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
bulmaIcon <- function(icon, color = NULL, size = NULL){
  
  if(missing(icon))
    stop("missing icon.", call. = FALSE)
  
  if(!is.null(color))
    color <- paste0("has-text-", color)
  
  if(!is.null(size))
    size <- paste0("is-", size)
  
  cl <- paste("icon", color, size)
  
  shiny::tags$span(
    class = cl,
    shiny::tags$i(
      class = icon
    )
  )
  
}