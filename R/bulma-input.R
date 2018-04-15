#' Add radio buttons
#'
#' @param inputId the input slot that will be used to access the value.
#' @param choices vector of choices, named or unnamed.
#' @param selected selected radio input.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaRadioInput("select", c("Miles per galon" = "mpg", "Rear axle ratio" = "drat"),
#'      selected = "mpg"),
#'    plotOutput("value")
#'   ),
#'   server = function(input, output) {
#'     output$value <- renderPlot(
#'       plot(1:nrow(mtcars), mtcars[[input$select]])
#'     )
#'   }
#' )
#' }
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

    if(choices$value[i] == selected)
      input <- shiny::tagAppendAttributes(input, checked = NA)

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
#' if(interactive()){
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
#' }
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
#' @param rounded set to round corners.
#'
#' @examples
#' if(interactive()){
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'    bulmaTitle("Hello Bulma"),
#'    bulmaSelectInput("var", "Select",
#'      choices = c("Miles per galon" = "mpg", "Displacement" = "disp")),
#'    tableOutput("plot")
#'   ),
#'   server = function(input, output) {
#'     output$plot <- renderTable({
#'       mtcars[, c("wt", input$var), drop = FALSE]
#'     }, rownames = TRUE)
#'   }
#' )
#' }
#' @export
bulmaSelectInput <- function(inputId, label, choices, rounded = FALSE){
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

  cl <- "select"
  if(isTRUE(cl)) cl <- paste(cl, "is-rounded")

  select <- shiny::tags$div(
    class = "field",
    shiny::tags$label(
      class = "label",
      label
    ),
    shiny::tags$div(
      class = "control",
      shiny::tags$div(
        class = cl,
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
#' if(interactive()){
#' library(shiny)
#'
#' shinyApp(
#'   ui = bulmaPage(
#'     bulmaActionButton("goButton", "Render in console")
#'   ),
#'   server = function(input, output) {
#'     observeEvent(input$goButton, {
#'       print("button clicked")
#'     })
#'  }
#' )
#' }
#' @export
bulmaActionButton <- function(inputId, label, color = NULL){

  cl <- "button shinyBulmaActionButton"

  if(!is.null(color)) cl <- paste0(cl, " is-", color)

  button <- shiny::tags$div(
    class = "control",
    shiny::tags$button(
      id = inputId,
      class = cl,
      value = 0,
      label
    )
  )

  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-button-js.js"), package = "shinybulma")
        )
      )
    ),
    button
  )
}



#' @title Add switch input
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create a switch input \url{https://wikiki.github.io/form/switch/}.
#'
#' @param inpuId The input slot that will be used to access the value.
#' @param label Switch label.
#' @param value TRUE or FALSE, FALSE by default.
#' @param color Switch color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param size Switch size : \code{small}, \code{medium} and \code{large}.
#' @param style Switch style :  \code{thin}, \code{rounded}, \code{outlined} or 
#' \code{mixed1}, \code{mixed2}, \code{mixed3} and \code{mixed4} (mixed1 is thin-rounded, mixed2
#' is thin-outlined, mixed3 is rounded-outlined and mixed4 is thin-rounded-outlined)
#' NULL by default, which corresponds to squared style.
#' 
#'
#' @export
#'
#' @examples
#' if(interactive()) {
#' library(shiny)
#' 
#' shinyApp(
#'  ui = bulmaNavbarPage(
#'    bulmaNavbar(
#'      bulmaNavbarBrand(
#'        bulmaNavbarItem(
#'          "shinybulma"
#'        ),
#'        bulmaNavbarBurger()
#'      ),
#'      bulmaNavbarMenu( # not visible on smaller devices
#'        bulmaNavbarItem(
#'          "Switch Inputs"
#'        )
#'      )
#'    ),
#'    bulmaNav(
#'      "Switch Inputs",
#'      div(style = "text-align: center;",
#'          bulmaTitle("The plot only displays if switch 1 is TRUE.")),
#'      
#'      br(), br(), hr(),
#'      
#'      bulmaContainer(
#'        bulmaColumns(
#'          bulmaColumn(
#'            width = 6,
#'            bulmaSubtitle("Inputs"),
#'            bulmaSwitchInput(
#'              inputId = "switch1", 
#'              label = "switch 1", 
#'              value = FALSE,
#'              color = NULL, 
#'              size = NULL, 
#'              style = NULL,
#'              rtl = FALSE, 
#'              disabled = FALSE),
#'            
#'            bulmaSwitchInput(
#'              inputId = "switch2", 
#'              label = "switch 2", 
#'              value = TRUE,
#'              color = "warning", 
#'              size = "large", 
#'              style = "rounded",
#'              
#'              rtl = FALSE, 
#'              disabled = TRUE),
#'            
#'            bulmaSwitchInput(
#'              inputId = "switch3", 
#'              label = "switch 3", 
#'              value = TRUE,
#'              
#'              color = "danger", 
#'              size = "small", 
#'              style = "thin",
#'              
#'              rtl = FALSE, 
#'              disabled = FALSE),
#'            
#'            bulmaSwitchInput(
#'              inputId = "switch4", 
#'              label = "switch 4", 
#'              value = FALSE,
#'              
#'              color = NULL, 
#'              size = NULL, 
#'              style = "mixed3",
#'              rtl = FALSE, 
#'              disabled = FALSE)
#'          ),
#'          bulmaColumn(
#'            width = 6,
#'            bulmaSubtitle("Outputs"),
#'            plotOutput("plot1"),
#'            uiOutput("switches")
#'          )
#'        )
#'      )
#'    )
#'  ),
#'  server = function(input, output) {
#'    
#'    output$plot1 <- renderPlot({
#'      if (input$switch1 == TRUE) {
#'        plot(mtcars$wt, mtcars$mpg)
#'      }
#'    })
#'    
#'    output$switches <- renderPrint({
#'      c(input$switch1, input$switch2, input$switch3, input$switch4)
#'    })
#'  }
#'  )
#' }

bulmaSwitchInput <- function(inputId, label = NULL, value = FALSE, 
                             color = NULL, size = NULL, style = NULL, 
                             rtl = FALSE, disabled = FALSE) {
  
  cl <- "switch shinyBulmaSwitch"
  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (!is.null(size)) cl <- paste0(cl, " is-", size)
  if (!is.null(style)) {
    if (style == "mixed1") cl <- paste0(cl, " is-thin is-rounded")
    else if (style == "mixed2") cl <- paste0(cl, " is-thin is-outlined")
    else if (style == "mixed3") cl <- paste0(cl, " is-rounded is-outlined")
    else if (style == "mixed4") cl <- paste0(cl, " is-thin is-rounded is-outlined")
    else cl <- paste0(cl, " is-", style)
  }
  
  if (rtl == TRUE) cl <- paste0(cl, " is-rtl")
  
  field <- shiny::tags$div(
    class = "field"
  )
  
  switchInputTag <- shiny::tags$input(
    class = cl, 
    id = inputId, 
    name = inputId,
    type = "checkbox",
    shiny::tags$label(`for` = inputId, label)
  )
  
  if (!is.null(value) && value) switchInputTag$attribs$checked <- "checked"
  if (!is.null(disabled) && disabled) switchInputTag$attribs$disabled <- NA
  
  field <- shiny::tagAppendChild(field, switchInputTag)
  
  field
}

#' Slider
#' 
#' Add a slider input
#' 
#' @param inputId Id to access value.
#' @param value,min,max Current value, maximum and minimum of slider.
#' @param class Additional class.
#' @param size Size of slider, see details.
#' @param orient Slider orientation, takes, \code{horizontal} or \code{vertical}.
#' @param ... Any other parameter to pass to \code{input}.
#' 
#' @details 
#' Valid \code{size}:
#' \itemize{
#'   \item{\code{NULL} (standard)}
#'   \item{\code{small}}
#'   \item{\code{medium}}
#'   \item{\code{large}}
#' }
#' 
#' @examples 
#' if(interactive()){
#'   library(shiny)
#'   
#'   ui <- bulmaPage(
#'     bulmaContainer(
#'       br(),
#'       bulmaSliderInput("slider", 10, 3, 150),
#'       plotOutput("plot")
#'     )
#'   )
#'   
#'   server <- function(input, output){
#'     data <- reactive({
#'       rnorm(input$slider, 20, 4)
#'     })
#'     
#'     output$plot <- renderPlot({
#'       hist(data())
#'     })
#'   }
#'   
#'   shinyApp(ui, server)
#' }
#' 
#' @export
bulmaSliderInput <- function(inputId, value, min, max, step = 1, class = NULL, size = NULL, 
                             orient = "horizontal", ...){
  
  if(missing(value) || missing(min) || missing(max))
    stop("must pass value, min and max", call. = FALSE)
  
  cl <- paste("bulmaSliderInput slider has-output is-fullwidth", class)
  
  if(!is.null(size))
    size <- paste0("is-", size)
  
  cl <- paste0(cl, size)
  
  input <- shiny::tags$input(
    id = inputId,
    class = cl,
    type = "range",
    step = step,
    min = min,
    max = max,
    orient = orient,
    ...
  )
  
  output <- shiny::tags$output(
    `for` = inputId,
    value
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-slider-js.js"), package = "shinybulma")
        )
      )
    ),
    input, output
  )
}

#' Date picker
#' 
#' Add date picker
#' 
#' @param inputId Id to access value.
#' @param value Current date.
#' @param min,max Minimum and maximum selectable dates.
#' @param overlay Set to \code{TRUE} to heave the calendar appear as overlay.
#' @param lang Language.
#' @param class Additional CSS class.
#' @param ... any other option
#' 
#' @examples 
#' if(interactive()){
#'   ui <- bulmaPage(
#'     bulmaContainer(
#'       br(),
#'       bulmaDateInput("date", Sys.Date(), overlay = TRUE),
#'       verbatimTextOutput("selected")
#'     )
#'   )
#'   
#'   server <- function(input, output){
#'     
#'     output$selected <- renderText({
#'       input$date
#'     })
#'   }
#'   
#'   shiny::shinyApp(ui, server)
#' }
#' 
#' @note Does not work in RStudio, open app in browser.
#' 
#' @export
bulmaDateInput <- function(inputId, value, min = Sys.Date() - 3, max = Sys.Date(), 
                           overlay = FALSE, lang = 'en', class = NULL, ...){
  
  if(missing(inputId) || missing(value))
    stop("must pass inputId and value")

  var <- sample(LETTERS, 5)
  var <- paste0(var, collapse = "")
  
  fun <- paste0(
    "
document.addEventListener( 'DOMContentLoaded', function () {
  var ", var, " = new bulmaCalendar( document.getElementById( '", inputId, "' ), {
    dateFormat: 'yyyy-mm-dd', 
    lang: 'en', 
    overlay: ", noquote(tolower(overlay)), ",
    closeOnOverlayClick: true,
    closeOnSelect: true,
    onClose: function(){
      $('#", inputId, "').trigger('change');
    }
  } );
} );
    "
  )
  
  cl <- paste("input bulmaCalendarInput", class)
  
  input <- shiny::tags$input(
    id = inputId,
    class = cl,
    value = value,
    ...
  )
  
  shiny::tagList(
    shiny::singleton(
      shiny::tags$head(
        shiny::includeScript(
          system.file(file.path("js", "bulma-calendar.min.js"), package = "shinybulma")
        ),
        shiny::includeCSS(
          system.file(file.path("css", "bulma-extensions.min.css"), package = "shinybulma")
        ),
        shiny::includeCSS(
          system.file(file.path("css", "bulma-calendar.min.css"), package = "shinybulma")
        ),
        shiny::includeScript(
          system.file(file.path("js", "bulma-calendar-js.js"), package = "shinybulma")
        )
      )
    ),
    shiny::tags$script(fun),
    input
  )
  
}