# shinybulma <img src="http://rinterface.com/inst/images/shinybulma.svg" width="200px" align="right"/>

[![Travis build status](https://travis-ci.org/RinteRface/shinybulma.svg?branch=master)](https://travis-ci.org/RinteRface/shinybulma) [![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/RinteRface/shinybulma?branch=master&svg=true)](https://ci.appveyor.com/project/RinteRface/shinybulma)

![](https://bulma.io/images/made-with-bulma.png)

> [bulma.io](https://bulma.io) for [Shiny](https://shiny.rstudio.com/). Contains extensions: [bulma-extensions](https://wikiki.github.io) as well as [themes](https://jenil.github.io/bulmaswatch/).

## Installation

``` r
# install.packages("devtools")
devtools::install_github("RinteRface/shinybulma")
```

## Example

``` r
library(shiny)
library(shinybulma)

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
```

## Extensions demo

https://dgranjon.shinyapps.io/bulmaExtension/

