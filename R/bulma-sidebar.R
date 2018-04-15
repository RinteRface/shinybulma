#' @title bulma right sidebar
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a rigth sidebar \url{https://wikiki.github.io/components/quickview/}.
#'
#' @param ... Any element to include in the sidebar (such as input elements, ...)
#' @param header_title Sidebar header.
#' @param footer_content Footer content.
#' 
#' @note Not compatible with mobile display.
#'
#' @examples
#' if (interactive()) {
#'  library(shiny)
#'  
#'  ui <- bulmaPage(
#'    bulmaContainer(
#'    bulmaTitle("Right sidebar demo"),  
#'    HTML(
#'        paste0('<button class="button is-info" 
#'                data-show="quickview" data-target="quickviewDefault">
#'                <span class="icon"><i class="fas fa-cogs"></i>
#'                </span></button>
#'               ')
#'     )
#'    ),
#'    bulmaSidebar(
#'      header_title = "test",
#'      
#'      bulmaSubtitle("Input elements"),
#'      
#'      bulmaSliderInput("slider", color = "warning", 10, 3, 150),
#'      
#'      bulmaSwitchInput(
#'        inputId = "switch3", 
#'        label = "switch 3", 
#'        value = TRUE,
#'        
#'        color = "danger", 
#'        size = "small", 
#'        style = "thin",
#'        
#'        rtl = FALSE, 
#'        disabled = FALSE),
#'      
#'      bulmaSubtitle("Other Stuff")
#'      
#'    ),
#'    
#'    plotOutput("plot")
#'      )
#'  
#'  server <- function(input, output, session) {
#'    data <- reactive({
#'      rnorm(input$slider, 20, 4)
#'    })
#'    
#'    output$plot <- renderPlot({
#'      hist(data())
#'    })
#'  }
#'  
#'  shinyApp(ui = ui, server = server)
#' }
#' @export
bulmaSidebar <- function(..., header_title = NULL, footer_content = NULL) {
  sidebar <- shiny::tags$div(
    class = "quickview",
    id = "quickviewDefault",
    
    # header
    shiny::tags$header(
      class = "quickview-header",
      shiny::tags$p(class = "title", header_title),
      shiny::tags$span(class = "delete", `data-dismiss` = "quickview")
    ),
    
    # body
    shiny::tags$div(
      class = "quickview-body",
      shiny::tags$div(
        class = "quickview-block",
        shiny::tags$br(), shiny::tags$br(),
        ...
      )
    ),
    
    # footer
    shiny::tags$footer(class = "quickview-footer", footer_content)
    
  )
  
  # load libraries
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-sidebar.min.js"), package = "shinybulma")
        ),
        shiny::includeCSS(
          system.file(file.path("css", "bulma-sidebar.min.css"), package = "shinybulma")
        ),
        shiny::includeScript(
          system.file(file.path("js", "bulma-sidebar-js.js"), package = "shinybulma")
        )
      )
    ),
    sidebar
  )
}