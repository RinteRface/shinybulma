#' Add tiles
#'
#' Add masonry-like tiles.
#'
#' @inheritParams bulmaPage
#' @param title,subtitle tile title and subtitle.
#' @param color color of tile.
#' @param vertical set to \code{TRUE} if you want to stack tiles vertically.
#' @param width define width of tile.
#' @param type type of tile: notification or box.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTileAncestor(
#'      bulmaTileParent(
#'        vertical = TRUE,
#'        bulmaTileChild(
#'          bulmaTitle("Tile 1"),
#'          tags$p("some graph"),
#'          color = "primary"
#'        ),
#'        bulmaTileChild(
#'          bulmaTitle("Tile 2"),
#'          plotOutput("graph")
#'        )
#'      ),
#'      bulmaTileParent(
#'        bulmaTileChild(
#'          bulmaTitle("Tile 3"),
#'          tags$p("some other graph")
#'        ),
#'        bulmaTileChild(
#'          bulmaTitle("Tile 5"),
#'          tags$p("some other graph")
#'        ),
#'        bulmaTileChild(
#'          bulmaTitle("Tile 6"),
#'          tags$p("some other graph")
#'        )
#'      )
#'    )
#'   ),
#'   server = function(input, output) {
#'     output$graph <- renderPlot({
#'       plot(x = runif(20, 5, 10), y = runif(20, 10, 12))
#'     })
#'   }
#' )
#' }
#'
#' @author John Coene, \email{jcoenep@@gmail.com}
#' @rdname tiles
#' @export
bulmaTileAncestor <- function(...){
  shiny::tags$div(
    class = "tile is-ancestor",
    ...
  )
}

#' @rdname tiles
#' @export
bulmaTileParent <- function(..., vertical = FALSE, width = NULL){
  
  cl <-"tile is-parent"
  
  if(isTRUE(vertical)) cl <- paste(cl, "is-vertical")
  if(!is.null(width)) cl <- paste0(cl, " is-")
  
  shiny::tags$div(
    class = cl,
    ...
  )
}

#' @rdname tiles
#' @export
bulmaTileChild <- function(..., title = "", subtitle = "", color = NULL,
                           type = "notification"){
  
  cl <- paste0("tile is-child ", type)
  
  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  
  shiny::tags$article(
    class = cl,
    shiny::tags$p(
      title,
      class = "title"
    ),
    shiny::tags$p(
      subtitle,
      class = "subtitle"
    ),
    ...
  )
}
