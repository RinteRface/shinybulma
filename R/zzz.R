.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "bulmathemes",
    system.file("bulmathemes", package = "shinybulma")
  )
  
  shiny::addResourcePath(
    "bulmacss",
    system.file("css", package = "shinybulma")
  )
  
  shiny::addResourcePath(
    "bulmajs",
    system.file("js", package = "shinybulma")
  )
}