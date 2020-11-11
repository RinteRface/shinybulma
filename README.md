# shinybulma <img src="http://rinterface.com/inst/images/shinybulma.svg" width="150px" align="right"/>

[![R build status](https://github.com/RinteRface/shinybulma/workflows/R-CMD-check/badge.svg)](https://github.com/RinteRface/shinybulma/actions)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-ff69b4.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN status](https://www.r-pkg.org/badges/version/shinybulma)](https://cran.r-project.org/package=shinybulma)

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


## Code of Conduct
  
  Please note that the shinybulma project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.