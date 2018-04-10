#' @title bulma carousel
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a carousel \url{https://wikiki.github.io/components/carousel/}.
#'
#' @param ... Slot for bulmaCarouselItem.
#' @param autoplay FALSE by default. If TRUE, the carousel automatically change its content.
#' @param navigation Where to display the navigations arrow : \code{centered} or \code{overlay}.
#' If NULL, arrows are at the bottom and more spaced.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' if (interactive()) {
#'  library(shiny)
#'
#'  ui <- bulmaPage(
#'   bulmaContainer(
#'     bulmaCarousel(
#'      autoplay = TRUE, navigation = "overlay",
#'
#'      bulmaCarouselItem(
#'        background = TRUE, active = TRUE,
#'        src = "https://wikiki.github.io/images/merry-christmas.jpg",
#'        title = "Merry Christmas", url = NULL, url_text = NULL
#'      ),
#'      bulmaCarouselItem(
#'        background = TRUE, active = FALSE,
#'        src = "https://wikiki.github.io/images/singer.jpg",
#'        title = "Original Gift: Offer a song with",
#'        url = "https://lasongbox.com", url_text = "La Song Box"
#'      ),
#'      bulmaCarouselItem(
#'        background = TRUE, active = FALSE,
#'        src = "https://wikiki.github.io/images/sushi.jpg",
#'        title = "Sushi time", url = NULL, url_text = NULL
#'      ),
#'      bulmaCarouselItem(
#'        background = TRUE, active = FALSE,
#'        src = "https://wikiki.github.io/images/life.jpg",
#'        title = "Life", url = NULL, url_text = NULL
#'      )
#'    )
#'   )
#'  )
#'
#'  server <- function(input, output, session) {
#'
#'  }
#'
#'  shinyApp(ui = ui, server = server)
#'
#' }
#' }


# navigation: centered, overlay
# autoplay: TRUE or FALSE
bulmaCarousel <- function(..., autoplay = FALSE, navigation = NULL) {

  cl_nav <- "carousel-navigation"
  if (!is.null(navigation)) cl_nav <- paste0(cl_nav, " is-", navigation)

  # translate TRUE into true for javascript
  if (autoplay == TRUE)
    autoplay <- "true"

  # main panel
  shiny::tags$div(
    class = "carousel carousel-animated carousel-animate-slide",
    `data-autoplay` = autoplay,
    shiny::tags$div(
      class = "carousel-container",
      ...
    ),
    # navigation arrows
    shiny::tags$div(
      class = cl_nav,
      shiny::tags$div(
        class = "carousel-nav-left",
        shiny::tags$i(class = "fa fa-chevron-left", `aria-hidden` = TRUE)
      ),
      shiny::tags$div(
        class = "carousel-nav-right",
        shiny::tags$i(class = "fa fa-chevron-right", `aria-hidden` = TRUE)
      )
    )
  )
}


#' @title bulma carousel item
#'
#' @description Create a carousel item \url{https://wikiki.github.io/components/carousel/}.
#'
#' @param background by default TRUE. The item background.
#' @param active TRUE of FALSE. The item which will be displayed first has to
#' be TRUE. All others will be FALSE.
#' @param src Image path.
#' @param title Item title.
#' @param url External link, if any.
#' @param url_text External link text, if any.
#'
#' @export
#'

bulmaCarouselItem <- function(background = TRUE, active = FALSE, src = NULL,
                              title = NULL, url = NULL, url_text = NULL) {
  cl <- "carousel-item"

  if (background == TRUE) cl <- paste0(cl, " has-background")
  if (active == TRUE) cl <- paste0(cl, " is-active")

  shiny::tags$div(
    class = cl,
    shiny::tags$img(
      class = "is-background", src = src, alt = "", width = "640", height = "310"
    ),
    shiny::tags$div(
      class = "title",
      paste0(title),
      if (!is.null(url)) shiny::tags$a(href = url, target = "_blank", paste0(url_text))
    )
  )
}
