#' Add container
#'
#' @inheritParams bulmaPage
#' @param fluid If you don't want to have a maximum width but want to keep the 24px margin on the left and right sides.
#' @param widescreen until the \code{widescreen} breakpoint.
#' @param fullhd until the \code{fullhd} breakpoint.
#' 
#' @note In order to take effect properly, containers need to be used as children of:
#' \itemize{
#'   \item{\code{\link{bulmaNavbar}}}
#'   \item{\code{\link{bulmaHero}}}
#'   \item{\code{\link{bulmaSection}}}
#'   \item{\code{\link{bulmaFooter}}}
#' }
#'
#' @author John Coene, \email{jcoenep@@gmail.com}
#'
#' @export
bulmaContainer <- function(..., fluid = FALSE, widescreen = FALSE, fullhd = FALSE){

  cl <- "container"

  if(isTRUE(fluid)) cl <- paste(cl, "is-fluid")

  shiny::tags$div(
    class = cl,
    ...
  )
}
