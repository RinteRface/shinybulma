#' @title bulma tags
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a tag \url{https://bulma.io/documentation/elements/tag/}.
#'
#' @param label Tag label.
#' @param color Tag color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param size Tag size : \code{small},\code{medium} and \code{large}.
#' @param style Tag style :  \code{rounded} or \code{delete}. NULL by default.
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
#'    bulmaColumns(
#'     bulmaColumn(
#'       width = 3,
#'       bulmaTag(label = "tag", color = "info", size = NULL, style = NULL),
#'       br(), br(),
#'       bulmaTag(label = "tag", color = "warning", size = NULL, style = NULL),
#'       br(), br(),
#'       bulmaTag(label = "tag", color = "success", size = "large", style = "rounded")
#'     ),
#'     bulmaColumn(
#'       width = 3,
#'       bulmaTagList(
#'         bulmaTag(label = "tag", color = "danger", size = "small", style = NULL),
#'         bulmaTag(label = "tag", color = "warning", size = "medium", style = NULL),
#'         bulmaTag(label = "tag", color = "success", size = "large", style = "rounded")
#'       )
#'     ),
#'     bulmaDivider(vertical = TRUE),
#'     bulmaColumn(
#'       width = 2,
#'       bulmaTagAddon(
#'         bulmaTag(label = "build", color = "dark", size = "small", style = NULL),
#'         bulmaTag(label = "passing", color = "success", size = "small", style = NULL)
#'       ),
#'       bulmaTagAddon(
#'         bulmaTag(label = "npm", color = "dark", size = "small", style = NULL),
#'         bulmaTag(label = "0.5.0", color = "info", size = "small", style = NULL)
#'       ),
#'       bulmaTagAddon(
#'         bulmaTag(label = "chat", color = "dark", size = "small", style = NULL),
#'         bulmaTag(label = "on gitter", color = "primary", size = "small", style = NULL)
#'       )
#'     ),
#'     bulmaColumn(
#'       width = 4,
#'       bulmaTagAddonList(
#'         bulmaTagAddons(
#'           bulmaTagAddon(
#'             bulmaTag(label = "build", color = "dark", size = "small", style = NULL),
#'             bulmaTag(label = "passing", color = "success", size = "small", style = NULL)
#'           )
#'         ),
#'         bulmaTagAddons(
#'           bulmaTagAddon(
#'             bulmaTag(label = "npm", color = "dark", size = "small", style = NULL),
#'             bulmaTag(label = "0.5.0", color = "info", size = "small", style = NULL)
#'           )
#'         ),
#'         bulmaTagAddons(
#'           bulmaTagAddon(
#'             bulmaTag(label = "chat", color = "dark", size = "small", style = NULL),
#'             bulmaTag(label = "on gitter", color = "primary", size = "small", style = NULL)
#'           )
#'         )
#'       )
#'      )
#'     )
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

bulmaTag <- function(label = NULL, color = NULL, size = NULL, style = NULL) {
  cl <- "tag"
  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (!is.null(size)) cl <- paste0(cl, " is-", size)
  if (!is.null(style)) cl <- paste0(cl, " is-", style)

  shiny::tags$span(
    class = cl,
    label
  )

}



#' @title bulma tag list
#'
#' @description Create a tag list of bulmaTag objects \url{https://bulma.io/documentation/elements/tag/}.
#'
#' @param ... Slot for bulmaTag.
#'
#' @export
#'

bulmaTagList <- function(...) {
  shiny::tags$div(
    class = "tags",
    ...
  )
}

############ tagAddons ############



#' @title bulma tag addon
#'
#' @description Merge two tags together \url{https://bulma.io/documentation/elements/tag/}.
#'
#' @param ... Slot for 2 bulmaTag.
#'
#' @export
#'

bulmaTagAddon <- function(...) {
  shiny::tags$div(
    class = "tags has-addons",
    ...
  )
}


#' @title bulma tag addon vertical list
#'
#' @description Create a vertical list of bulmaTagAddon objects \url{https://bulma.io/documentation/elements/tag/}.
#'
#' @param ... Slot for bulmaTagAddon.
#'
#' @export
#'

bulmaTagAddons <- function(...) {
  shiny::tags$div(
    class = "control",
    ...
  )
}


#' @title bulma tag addon horizontal list.
#'
#' @description Create an horizontal list of bulmaTagAddons objects \url{https://bulma.io/documentation/elements/tag/}.
#'
#' @param ... Slot for bulmaTagAddons.
#'
#' @export
#'

bulmaTagAddonList <- function(...) {
  shiny::tags$div(
    class = "field is-grouped is-grouped-multiline",
    ...
  )
}
