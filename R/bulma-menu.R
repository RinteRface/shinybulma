#' @title bulma Menu
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a menu \url{https://bulma.io/documentation/components/menu/}.
#'
#' @param ... Slot for bulmaMenuItem and bulmaMenuLabel.
#' 
#' @note You can include as many bulmaMenuLabel as you want. It is better to wrap a bulmaMenu in a bulmaContainer
#' as well as bulmaColumns (see example).
#' 
#' @export
#'
#' @examples
#' if(interactive()){
#'  library(shiny)
#'  
#'  shinyApp(
#'    ui = bulmaPage(
#'      bulmaTitle("Hello Bulma"),
#'      bulmaContainer(
#'        bulmaColumns(
#'          bulmaColumn(
#'            width = 4,
#'            bulmaMenu(
#'              
#'              # section 1
#'              bulmaMenuLabel(menu_label = "Title 1", target = "title1"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 1"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 2"),
#'              
#'              # section 2
#'              bulmaMenuLabel(menu_label = "Title 2", target = "title5"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 1"),
#'              bulmaMenuItem(
#'                active = TRUE, 
#'                item_label = "Subtitle 2",
#'                bulmaMenuSubItem(subitem_label = "Subsubtitle 1"),
#'                bulmaMenuSubItem(subitem_label = "Subsubtitle 2"),
#'                bulmaMenuSubItem(subitem_label = "Subsubtitle 3")
#'              ),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 3"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 4"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 5"),
#'              
#'              # section 3
#'              bulmaMenuLabel(menu_label = "Title 3", target = "title10"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 6"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 7"),
#'              bulmaMenuItem(active = FALSE, item_label = "Subtitle 8")
#'              
#'            )
#'          ),
#'          bulmaColumn(
#'            width = 8,
#'            
#'            bulmaTitle("Only title 1, title 2 and title 3 have html anchors."),
#'            
#'            bulmaRadioInput(
#'              "select", 
#'              c("Miles per galon" = "mpg", "Rear axle ratio" = "drat"),
#'              selected = "mpg"
#'            ),
#'            
#'            lapply(1:10, FUN = function(i) {
#'              list(
#'                bulmaTitle(paste0("Title", i), id = paste0("title", i)),
#'                plotOutput(paste0("plot", i))
#'              )
#'            })
#'            
#'          )
#'        )
#'      )
#'    ),
#'    server = function(input, output) {
#'      lapply(1:10, FUN = function(i) {
#'        output[[paste0("plot", i)]] <- renderPlot(
#'          plot(1:nrow(mtcars), mtcars[[input$select]])
#'        )
#'      })
#'      
#'    }
#'  )
#' }
bulmaMenu <- function(...) {
  
  shiny::tags$aside(
    class = "menu",
    ...
  )
  
}


#' @title bulma menu label
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create an label to insert in a bulmaMenu object \url{https://bulma.io/documentation/components/menu/}.
#' 
#' @param menu_label Title of the global menu section.
#' @param target Target to set an html anchor.
#' 
#' @export
bulmaMenuLabel <- function(menu_label = NULL, target = NULL) {
  shiny::tags$p(
    class = "menu-label",
    shiny::tags$a(href = paste0("#", target), menu_label)
  )
}


#' @title bulma menu item
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create an item to insert in a bulmaMenu object \url{https://bulma.io/documentation/components/menu/}.
#'
#' @param ... Slot for bulmaMenuSubItem.
#' @param active If the item is active or not. FALSE by default.
#' @param item_label Subsection label.
#' @param target Target to set an html anchor.
#'
#' @export
bulmaMenuItem <- function(..., active = FALSE, item_label = NULL, target = NULL) {
  shiny::tags$ul(
    class = "menu-list",
    shiny::tags$li(
      if (active == TRUE) {
        shiny::tags$a(
          href = paste0("#", target), 
          class = "is-active", 
          item_label
        )
      } else {
        shiny::tags$a(
          href = paste0("#", target),
          item_label
        )
      },
      shiny::tags$ul(
        ...
      )
    )
  )
}


#' @title bulma menu sub item
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create an sub item to insert in q bulmaMenuItem \url{https://bulma.io/documentation/components/menu/}.
#'
#' @param subitem_label Subsubsection label.
#' @param target Target to set an html anchor.
#' 
#' @export
bulmaMenuSubItem <- function(subitem_label = NULL, target = NULL) {
  shiny::tags$li(
    shiny::tags$a(
      href = paste0("#", target), 
      subitem_label
    )
  )
}