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
#'    bulmaSidebarTrigger()
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


#' @title bulma right sidebar trigger
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a button to trigger the rigth sidebar \url{https://wikiki.github.io/components/quickview/}.
#'
#' @param color Button color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param size Button size : \code{small},\code{medium} and \code{large}.
#' @param style Button style :  \code{outlined}, \code{inverted}, \code{rounded}
#' @param state Button state : \code{hovered} or \code{focused}. NULL by default.
#' 
#' @note Can be included in the navbar.
#' @export
bulmaSidebarTrigger <- function(color = NULL, size = NULL, style = NULL, state = NULL) {
  cl <- "button"
  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (!is.null(style)) cl <- paste0(cl, " is-", style)
  if (!is.null(size)) cl <- paste0(cl, " is-", size)
  if (!is.null(state)) cl <- paste0(cl, " is-", state)
  
  shiny::tags$button(
    class = cl,
    `data-show` = "quickview",
    `data-target` = "quickviewDefault",
    shiny::tags$span(
      class="icon",
      shiny::tags$i(class="fas fa-cogs")
    )
  )
}
