#' Add image
#'
#' Add an image.
#'
#' @param src path to image.
#' @param size set fixed image size, see details.
#' @param ratio set responsive ratio, see details.
#' @param alt image alt.
#'
#' @details
#' Valid \code{size}:
#' \itemize{
#'   \item{16 - 16x16}
#'   \item{24 - 24x24}
#'   \item{32 - 32x32}
#'   \item{48 - 48x48}
#'   \item{54 - 54x54}
#'   \item{96 - 96x96}
#'   \item{128 - 128x128}
#' }
#'
#' Valid \code{ratio}:
#' \itemize{
#'   \item{square or 1by1}
#'   \item{1by1}
#'   \item{4by3}
#'   \item{3by2}
#'   \item{16by9}
#'   \item{2by1}
#' }
#'
#' @examples
#' \dontrun{
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaImage("path/to/image")
#'   ),
#'   server = function(input, output) {}
#' )
#' }
#'
#' @export
bulmaImage <- function(src, size = NULL, ratio = NULL, alt = ""){

  if(missing(src))
    stop("missing src", call. = FALSE)

  cl <- "image"

  if(!is.null(size)) cl <- paste0(cl, " is-", paste0(rep(size, 2), collapse = "x"))
  if(!is.null(ratio)) cl <- paste0(cl, " is-", ratio)

  shiny::tags$figure(
    class = cl,
    shiny::tags$img(
      src,
      alt
    )
  )
}
