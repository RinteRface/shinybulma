# Add an html dependency, without overwriting existing ones
appendDependencies <- function(x, value) {
  if (inherits(value, "html_dependency"))
    value <- list(value)
  
  old <- attr(x, "html_dependencies", TRUE)
  
  htmltools::htmlDependencies(x) <- c(old, value)
  x
}

# Add dashboard dependencies to a tag object
addDeps <- function(x, theme) {
  
  # bulma
  bulma_css <- "https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.2/css/"
  # fontawesome
  fontawesome_css <- "https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/"
  fontawesome_js <- "https://use.fontawesome.com/releases/v5.0.7/js/"
  # bulma extensions
  bulma_extensions_css <- "bulma-extensions.min.css"
  bulma_extensions_js <- "bulma-extensions.min.js"
  # others
  bulma_themes_css <- paste0(tolower(theme), ".min.css")
  jquery_ui_js <- "jquery-ui.min.js"
  custom_js <- "custom-js.js"

  
  bulmaDeps <- list(
    # bulma CSS (CDN)
    htmltools::htmlDependency(
      name = "bulma", 
      version = as.character(utils::packageVersion("shinybulma")),
      src = c(href = bulma_css),
      stylesheet = "bulma.min.css"
    ),
    # bulma extensions (from http://bulma.io/extensions/)
    htmltools::htmlDependency(
      name = "bulma-extensions", 
      version = "3.0.0",
      src = c(file = system.file("bulma-extensions-3.0.0", package = "shinybulma")),
      script = bulma_extensions_js,
      stylesheet = bulma_extensions_css
    ),
    # Themes
    if (!is.null(theme)) {
      htmltools::htmlDependency(
        name = "bulma-themes", 
        version = "0.7.2",
        src = c(file = system.file("bulma-themes-0.7.2", package = "shinybulma")),
        script = bulma_themes_css
      )
    },
    # jquery UI deps for sortable elements
    htmltools::htmlDependency(
      name = "jquery-ui", 
      version = "1.12.1",
      src = c(file = system.file("jquery-ui-1.12.1", package = "shinybulma")),
      script = jquery_ui_js
    ),
    # fontawesome CSS (CDN)
    htmltools::htmlDependency(
      name = "fontawesome",
      version = as.character(utils::packageVersion("shinybulma")),
      src = c(href = fontawesome_css),
      stylesheet = "font-awesome.min.css"
    ),
    # fontawesome JS (CDN)
    htmltools::htmlDependency(
      name = "fontawesome",
      version = as.character(utils::packageVersion("shinybulma")),
      src = c(href = fontawesome_js),
      stylesheet = "all.js"
    ),
    # Custom js (inputs, ...)
    htmltools::htmlDependency(
      name = "js", 
      version = "0.7.2",
      src = c(file = system.file("js-0.7.2", package = "shinybulma")),
      script = list.files(system.file("js-0.7.2", package = "shinybulma"))
    )
  )
  appendDependencies(x, bulmaDeps)
}