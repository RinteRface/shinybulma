#' Show loading page
#' 
#' @param title Title of loading page.
#' @param class Any additional class.
#' 
#' @export
bulmaLoading <- function(title = "Loading", class = NULL){
  cl <- paste("pageloader", class)
  tags <- shiny::tags$div(
    class = cl,
    shiny::tags$span(
      class = "title",
      title
    )
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeCSS(
          system.file(file.path("css", "bulma-pageloader.min.css"), package = "shinybulma")
        )
      )
    ),
    tags
  )
}