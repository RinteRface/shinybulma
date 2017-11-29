# shinybulma

[bulma.io](https://bulma.io) for [Shiny](https://shiny.rstudio.com/).

## Installation

``` r
# install.packages("devtools")
devtools::install_github("JohnCoene/shinybulma")
```

## Example

``` r
ui <- bulmaPage(
  bulmaColumns(
    bulmaColumn(
      width = 4
    ),
    bulmaColumn(
      width = 4
    ),
    bulmaColumn(
      width = 4
    )
  )
)

# Server logic
server <- function(input, output) {}

# Complete app with UI and server components
shinyApp(ui, server)
```
