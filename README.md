# shinybulma

[bulma.io](https://bulma.io) for [Shiny](https://shiny.rstudio.com/). Contains
also some extensions: [bulma-extensions](https://wikiki.github.io)

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/shinybulma")
```

## Example

``` r
library(shiny)

shinyApp(
  ui = bulmaPage(
  bulmaHero(
  	  fullheight = TRUE,
	  color = "primary",
	  bulmaHeroBody(
	  	  bulmaContainer(
		  	  bulmaTitle("Shiny meets Bulma!"),
			  bulmaSubtitle("A neat framework for your Shiny apps.")
		  )
	  )
  ),
  bulmaSection(
  	  bulmaContainer(
	  	  bulmaTileAncestor(
		  	  bulmaTileParent(
			  	  vertical = TRUE,
				  bulmaTileChild(
				  	  bulmaTitle("Tile 1"),
					  p("Put some data here"),
					  color = "link"
				  ),
				  bulmaTileChild(
				  	  bulmaTitle("Tile 2"),
					  plotOutput("chart"),
					  color = "danger"
				  )
			  ),
		  	  bulmaTileParent(
			  	  vertical = TRUE,
				  bulmaTileChild(
				  	  bulmaTitle("Tile 3"),
					  p("Put some data here"),
					  color = "warning"
				  ),
				  bulmaTileChild(
				  	  bulmaTitle("Tile 3"),
					  ("Put some data here"),
					  color = "info"
				  )
			  )
		  )
	  )
  )
  ),
  server = function(input, output) {
    output$chart <- renderPlot({
      plot(x = runif(20, 5, 10), y = runif(20, 10, 12))
    })
  }
)

# Server logic
server <- function(input, output) {}

# Complete app with UI and server components
shinyApp(ui, server)
```

## bulma extension demo

https://dgranjon.shinyapps.io/bulmaExtension/

