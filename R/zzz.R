.onLoad <- function(libname, pkgname) {
  shiny::addResourcePath(
    "bulmathemes",
    system.file("bulmathemes", package = "shinybulma")
  )
}