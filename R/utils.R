bulma_page <- function(...){
  shiny::tags$html(
    # Head --------------------------------------------------------------------
    id = "shinybulma-html",
    shiny::tags$head(
      shiny::tags$meta(
        charset = "utf-8"
      ),
      shiny::tags$meta(
        name = "viewport",
        content = "width=device-width, initial-scale=1"
      ),
      shiny::tags$link(
        rel = "stylesheet",
        href = "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
      ),
      shiny::includeCSS(
        system.file("css/bulma.min.css", package = "shinybulma")
      ),
      shiny::includeScript(
        system.file("js/jquery.min.js", package = "shinybulma")
      ),
      shiny::includeScript(
        system.file("js/jquery-ui.min.js", package = "shinybulma")
      )
    ),
    # Body --------------------------------------------------------------------
    shiny::tags$body(
      ...,
      shiny::includeScript(
        system.file("js/custom-js.js",
                    package = "shinybulma")
      )
    )
  )
}
