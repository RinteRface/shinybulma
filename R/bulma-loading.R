#' Show loading page
#' 
#' @param title Title of loading page.
#' @param class Any additional class.
#' 
#' @examples 
#' if(interactive()){
#'   ui <- bulmaPage(
#'     bulmaTitle("Loader"),
#'     bulmaSliderInput("slider", 50, 5, 100, step = 5),
#'     bulmaLoading(),
#'     bulmaContainer(
#'       plotOutput("plot")
#'     )
#'   )
#'   
#'   server <- function(input, output){
#'     data <- reactive({
#'       rnorm(input$slider, 10, 5)
#'     })
#'     
#'     output$plot <- renderPlot({
#'       hist(data())
#'     })
#'   }
#'   
#'   shiny::shinyApp(ui, server)
#' }
#' 
#' @author John Coene, \email{jcoenep@@gmail.com}
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
  
  return(tags)
}