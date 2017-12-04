#' Add radio buttons
#'
#' @param inputId the input slot that will be used to access the value.
#' @param choices vector of choices.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaRadioInput("radio-buttons", c("Yes", "No"))
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @export
bulmaRadioInput <- function(inputId, choices){
  if(missing(choices)) stop("missing choices", call. = FALSE)

  shiny::tags$div(
    class = "control"
  ) -> control

  for(choice in choices){
    choiceTag <- shiny::tags$label(class = "radio", choice,
                                   shiny::tags$input(
                                     type = "radio",
                                     name = inputId
                                   ))
    control <- shiny::tagAppendChild(control, choiceTag)
  }

  shiny::tags$div(
    class = "field",
    shiny::tags$div(
      class = "control",
      control
    )
  )
}

#' Add text input
#'
#' @param inputId the input slot that will be used to access the value.
#' @param label input label.
#' @param placeholder input placeholder.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaTextInput("text-input", label = "Input text", placeholder = "Type here")
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @export
bulmaTextInput <- function(inputId, label, placeholder){
  shiny::tags$div(
    class = "field",
    shiny::tags$label(
      class = "label",
      label
    ),
    shiny::tags$div(
      class = "control",
      shiny::tags$input(
        class = "input",
        type = "text",
        placeholder = placeholder
      )
    )
  )
}

#' Add dropdown input
#'
#' @param inputId the input slot that will be used to access the value.
#' @param label input label.
#' @param choices vector of choices.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaSelectInput("dropdown", "Select", choices = c("Shiny", "Bulma"))
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @export
bulmaSelectInput <- function(inputId, label, choices){
  select <- shiny::tags$select()

  for(choice in choices){
    select <- shiny::tagAppendChild(select, shiny::tags$option(choice))
  }

  shiny::tags$div(
    class = "field",
    shiny::tags$label(
      class = "label",
      label
    ),
    shiny::tags$div(
      class = "control",
      shiny::tags$div(
        class = "select",
        select
      )
    )
  )
}

#' Add submit button
#'
#' @param inputId the input slot that will be used to access the value.
#' @param color button color.
#' @param label button label.
#'
#' @examples
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaSubmitButton("submit-button", "Submit", "primary")
#'   ),
#'   server = function(input, output) {}
#' )
#'
#' @export
bulmaSubmitButton <- function(inputId, label, color){

  cl <- "button"

  if(!is.null(color)) cl <- paste0(cl, " is-", color)

  shiny::tags$div(
    class = "control",
    shiny::tags$button(
      class = cl,
      label
    )
  )
}
