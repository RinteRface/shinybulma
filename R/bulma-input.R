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
#'    bulmaRadioInput("select", c("Miles per galon" = "mpg", "Rear axle ratio" = "drat"),
#'      selected = "Miles"),
#'    plotOutput("plot")
#'   ),
#'   server = function(input, output) {
#'     output$plot <- renderPlot(
#'       plot(1:nrow(mtcars), mtcars[[input$select]])
#'     )
#'   }
#' )
#'
#' @export
bulmaRadioInput <- function(inputId, choices, selected){
  if(missing(choices) || missing(selected))
    stop("missing choices or selected", call. = FALSE)

  if(length(names(choices))){
    choices <- data.frame(name = names(choices), value = unname(choices))
  } else {
    choices <- data.frame(name = choices, value = choices)
  }

  shiny::tags$div(
    id = inputId,
    class = "control shinyBulmaRadio"
  ) -> control

  for(i in 1:nrow(choices)){

    input <- shiny::tags$input(
      type = "radio",
      name = inputId,
      value = choices$value[i]
    )

    if(choices$name[i] == selected)
      input <- tagAppendAttributes(input, checked = NA)

      choiceTag <- shiny::tags$label(class = "radio", choices$name[i],
                                     input)

      control <- shiny::tagAppendChild(control, choiceTag)
  }

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-radio-js.js"), package = "shinybulma")
        )
      )
    ),
    control
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
#'    bulmaTextInput("txt", label = "Input text", placeholder = "Type here"),
#'    verbatimTextOutput("default")
#'   ),
#'   server = function(input, output) {
#'     output$default <- renderText({ input$txt })
#'   }
#' )
#'
#' @export
bulmaTextInput <- function(inputId, label, placeholder){
  txt <- shiny::tags$div(
    class = "field",
    shiny::tags$label(
      class = "label",
      label
    ),
    shiny::tags$div(
      class = "control",
      shiny::tags$input(
        class = "input shinybulmaTextInput",
        type = "text",
        id = inputId,
        placeholder = placeholder
      )
    )
  )

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-text-js.js"), package = "shinybulma")
        )
      )
    ),
    txt
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
#'    bulmaSelectInput("var", "Select", choices = c("mpg", "disp")),
#'    tableOutput("plot")
#'   ),
#'   server = function(input, output) {
#'     output$plot <- renderTable({
#'       mtcars[, c("wt", input$var), drop = FALSE]
#'     }, rownames = TRUE)
#'   }
#' )
#'
#' @export
bulmaSelectInput <- function(inputId, label, choices){
  select <- shiny::tags$select(
    id = inputId,
    class = "shinyBulmaSelect"
  )

  if(length(names(choices))){
    opts <- data.frame(name = names(choices), value = unname(choices))
  } else {
    opts <- data.frame(name = unname(choices), value = unname(choices))
  }

  for(i in 1:nrow(opts)){
    select <- shiny::tagAppendChild(select,
                                    shiny::tags$option(
                                      opts$name[i],
                                      value = opts$value[i]
                                    ))
  }

  select <- shiny::tags$div(
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

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-select-js.js"), package = "shinybulma")
        )
      )
    ),
    select
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
