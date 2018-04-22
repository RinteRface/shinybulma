# shinybulma

[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/shinybulma.svg?branch=master)](https://travis-ci.org/JohnCoene/shinybulma) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/JohnCoene/shinybulma?branch=master&svg=true)](https://ci.appveyor.com/project/JohnCoene/shinybulma)

![](https://bulma.io/images/made-with-bulma.png)

[bulma.io](https://bulma.io) for [Shiny](https://shiny.rstudio.com/). Contains extensions: [bulma-extensions](https://wikiki.github.io) as well as [themes](https://jenil.github.io/bulmaswatch/).

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

## Extensions demo

https://dgranjon.shinyapps.io/bulmaExtension/

