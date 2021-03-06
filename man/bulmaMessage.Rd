% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bulma-message.R
\name{bulmaMessage}
\alias{bulmaMessage}
\title{bulma messqge}
\usage{
bulmaMessage(
  ...,
  color = NULL,
  size = NULL,
  header = TRUE,
  header_title = NULL
)
}
\arguments{
\item{...}{Any message to display in the body.}

\item{color}{Message color : \code{link}, \code{info}, \code{primary}, \code{warning},
\code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.}

\item{size}{Message size : \code{small}, \code{medium} and \code{large}. NULL by default,
which corresponds to normal size.}

\item{header}{Message header. Display the header or not, TRUE by default.}

\item{header_title}{Header title, if any.}
}
\description{
Create a nice box for messages \url{https://bulma.io/documentation/elements/message/}.
}
\examples{
if (interactive()) {
  library(shiny)
  
  ui <- bulmaPage(
    bulmaContainer(
      bulmaColumns(
        bulmaColumn(
          width = 4,
          bulmaMessage(
            color = NULL, 
            size = "large", 
            header = TRUE, 
            header_title = "First message",
            "Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit. 
            Pellentesque risus mi, tempus 
            quis placerat ut, porta nec nulla. 
            Vestibulum rhoncus ac ex sit amet 
            fringilla. Nullam gravida purus diam, 
            et dictum felis venenatis efficitur. 
            Aenean ac eleifend lacus, in mollis 
            lectus. Donec sodales, arcu et 
            sollicitudin porttitor, tortor urna 
            tempor ligula, id porttitor mi magna a 
            neque. Donec dui urna, vehicula et 
            sem eget, facilisis sodales sem."
          )
        ),
        bulmaColumn(
          width = 4,
          bulmaMessage(
            color = "warning", 
            size = NULL, 
            header = FALSE,
            "Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit. 
            Pellentesque risus mi, tempus 
            quis placerat ut, porta nec nulla. 
            Vestibulum rhoncus ac ex sit amet 
            fringilla. Nullam gravida purus diam, 
            et dictum felis venenatis efficitur. 
            Aenean ac eleifend lacus, in mollis 
            lectus. Donec sodales, arcu et 
            sollicitudin porttitor, tortor urna 
            tempor ligula, id porttitor mi magna a 
            neque. Donec dui urna, vehicula et 
            sem eget, facilisis sodales sem."
          )
        ),
        bulmaColumn(
          width = 4,
          bulmaMessage(
            color = "danger", 
            size = "small", 
            header = TRUE, 
            header_title = "Third message",
            "Lorem ipsum dolor sit amet, 
            consectetur adipiscing elit. 
            Pellentesque risus mi, tempus 
            quis placerat ut, porta nec nulla. 
            Vestibulum rhoncus ac ex sit amet 
            fringilla. Nullam gravida purus diam, 
            et dictum felis venenatis efficitur. 
            Aenean ac eleifend lacus, in mollis 
            lectus. Donec sodales, arcu et 
            sollicitudin porttitor, tortor urna 
            tempor ligula, id porttitor mi magna a 
            neque. Donec dui urna, vehicula et 
            sem eget, facilisis sodales sem."
          )
        )
      )
    )
  )
  
  server <- function(input, output, session) {
    
  }
  
  shinyApp(ui = ui, server = server)
}
}
\author{
David Granjon, \email{dgranjon@ymail.com}
}
