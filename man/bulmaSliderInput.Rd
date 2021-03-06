% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bulma-input.R
\name{bulmaSliderInput}
\alias{bulmaSliderInput}
\title{Slider}
\usage{
bulmaSliderInput(
  inputId,
  value,
  min,
  max,
  color = NULL,
  step = 1,
  class = NULL,
  size = NULL,
  orient = "horizontal",
  ...
)
}
\arguments{
\item{inputId}{Id to access value.}

\item{value, min, max}{Current value, maximum and minimum of slider.}

\item{color}{Slider color.}

\item{step}{Slider step.}

\item{class}{Additional class.}

\item{size}{Size of slider, see details.}

\item{orient}{Slider orientation, takes, \code{horizontal} or \code{vertical}.}

\item{...}{Any other parameter to pass to \code{input}.}
}
\description{
Add a slider input.
}
\details{
Valid \code{size}:
\itemize{
  \item{\code{NULL} (standard)}
  \item{\code{small}}
  \item{\code{medium}}
  \item{\code{large}}
}
}
\examples{
if(interactive()){
  library(shiny)
  
  ui <- bulmaPage(
    bulmaContainer(
      br(),
      bulmaSliderInput("slider", 10, 3, 150),
      plotOutput("plot")
    )
  )
  
  server <- function(input, output){
    data <- reactive({
      rnorm(input$slider, 20, 4)
    })
    
    output$plot <- renderPlot({
      hist(data())
    })
  }
  
  shinyApp(ui, server)
}
}
\author{
John Coene, \email{jcoenep@gmail.com}
}
