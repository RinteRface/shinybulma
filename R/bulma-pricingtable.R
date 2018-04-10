#' @title bulma pricing table
#'
#' @author David Granjon, \email{dgranjon@@ymail.com}
#'
#' @description Create an horizontal or vertical pricing table \url{https://wikiki.github.io/components/pricingtable/}.
#'
#' @param ... Slot for bulmaPricingPlan.
#' @param horizontal FALSE by default. Whether to display the table vertically
#' or horizontally.
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
#'    shiny::column(width = 12, align = "center",
#'     bulmaTitle("Bulma Vertical Pricing Table")
#'     ),
#'
#'     br(), br(),
#'
#'     bulmaPricingtable(
#'       horizontal = FALSE,
#'       bulmaPricingPlan(
#'         active = FALSE, color = NULL, plan_title = "Starter",
#'         plan_price = 20, plan_currency = "$",
#'         plan_period = "/month", button_status = "disabled",
#'         button_name = "Current plan",
#'         bulmaPricingPlanItem(name = "20GB Storage"),
#'         bulmaPricingPlanItem(name = "10 domains"),
#'         bulmaPricingPlanItem(name = "-"),
#'         bulmaPricingPlanItem(name = "-")
#'       ),
#'       bulmaPricingPlan(
#'         active = FALSE, color = "warning", plan_title = "Startups",
#'         plan_price = 40, plan_currency = "$",
#'         plan_period = "/month", button_status = NULL,
#'         button_name = "Choose",
#'         bulmaPricingPlanItem(name = "20GB Storage"),
#'         bulmaPricingPlanItem(name = "25 domains"),
#'         bulmaPricingPlanItem(name = "1TB Bandwidth"),
#'         bulmaPricingPlanItem(name = "-")
#'       ),
#'       bulmaPricingPlan(
#'         active = TRUE, color = NULL, plan_title = "Growing Team",
#'         plan_price = 60, plan_currency = "$",
#'         plan_period = "/month", button_status = NULL,
#'         button_name = "Choose",
#'         bulmaPricingPlanItem(name = "200GB Storage"),
#'         bulmaPricingPlanItem(name = "50 domains"),
#'         bulmaPricingPlanItem(name = "1TB Bandwidth"),
#'         bulmaPricingPlanItem(name = "100 Email Boxes")
#'       ),
#'       bulmaPricingPlan(
#'         active = FALSE, color = "danger", plan_title = "Enterprise",
#'         plan_price = 100, plan_currency = "$",
#'         plan_period = "/month", button_status = NULL,
#'         button_name = "Choose",
#'         bulmaPricingPlanItem(name = "200GB Storage"),
#'         bulmaPricingPlanItem(name = "50 domains"),
#'         bulmaPricingPlanItem(name = "1TB Bandwidth"),
#'         bulmaPricingPlanItem(name = "1000 Email Boxes")
#'       )
#'     ),
#'
#'     br(), br(),
#'
#'     bulmaDivider(),
#'
#'     shiny::column(width = 12, align = "center",
#'                   bulmaTitle("Bulma Horizontal Pricing Table")
#'     ),
#'
#'     br(), br(),
#'
#'     bulmaPricingtable(
#'       horizontal = TRUE,
#'       bulmaPricingPlan(
#'         active = FALSE, color = NULL, plan_title = "Starter",
#'         plan_price = 20, plan_currency = "$",
#'         plan_period = "/month", button_status = "disabled",
#'         button_name = "Current plan",
#'         bulmaPricingPlanItem(name = "20GB Storage"),
#'         bulmaPricingPlanItem(name = "10 domains"),
#'         bulmaPricingPlanItem(name = "-"),
#'         bulmaPricingPlanItem(name = "-")
#'       ),
#'       bulmaPricingPlan(
#'         active = FALSE, color = "warning", plan_title = "Startups",
#'         plan_price = 40, plan_currency = "$",
#'         plan_period = "/month", button_status = NULL,
#'         button_name = "Choose",
#'         bulmaPricingPlanItem(name = "20GB Storage"),
#'         bulmaPricingPlanItem(name = "25 domains"),
#'         bulmaPricingPlanItem(name = "1TB Bandwidth"),
#'         bulmaPricingPlanItem(name = "-")
#'       ),
#'       bulmaPricingPlan(
#'         active = TRUE, color = NULL, plan_title = "Growing Team",
#'         plan_price = 60, plan_currency = "$",
#'         plan_period = "/month", button_status = NULL,
#'         button_name = "Choose",
#'         bulmaPricingPlanItem(name = "200GB Storage"),
#'         bulmaPricingPlanItem(name = "50 domains"),
#'         bulmaPricingPlanItem(name = "1TB Bandwidth"),
#'         bulmaPricingPlanItem(name = "100 Email Boxes")
#'       ),
#'       bulmaPricingPlan(
#'         active = FALSE, color = "danger", plan_title = "Enterprise",
#'         plan_price = 100, plan_currency = "$",
#'         plan_period = "/month", button_status = NULL,
#'         button_name = "Choose",
#'         bulmaPricingPlanItem(name = "200GB Storage"),
#'         bulmaPricingPlanItem(name = "50 domains"),
#'         bulmaPricingPlanItem(name = "1TB Bandwidth"),
#'         bulmaPricingPlanItem(name = "1000 Email Boxes")
#'       )
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

bulmaPricingtable <- function(..., horizontal = FALSE) {

  cl <- "pricing-table"
  if (horizontal == TRUE) cl <- paste0(cl, " is-horizontal")
  shiny::tags$div(
    class = cl,
    ...
  )
}

#' @title bulma pricing table plan
#'
#' @description Create a pricing table plan to insert in a bulmaPricingTable \url{https://wikiki.github.io/components/pricingtable/}.
#'
#' @param ... Slot for bulmaPricingPlanItem.
#' @param active FALSE by default. If TRUE, the corresponding pricing plan
#' is highlighted.
#' @param color Plan color : \code{link}, \code{info}, \code{primary}, \code{warning},
#'  \code{danger}, \code{success}, \code{black}, \code{dark} and \code{ligth}.
#' @param plan_title Plan title.
#' @param plan_price Plan price.
#' @param plan_currency Plan currency.
#' @param plan_period Payment periodicity.
#' @param button_status Button status. NULL or \code{"disabled"}.
#' @param button_name Button label.
#'
#' @note the status "disabled" does not work at the moment.
#'
#' @export
#'

bulmaPricingPlan <- function(..., active = FALSE, color = NULL, plan_title = NULL,
                             plan_price = NULL, plan_currency = NULL,
                             plan_period = NULL, button_status = NULL,
                             button_name = NULL) {

  cl <- "pricing-plan"
  if (!is.null(color)) cl <- paste0(cl, " is-", color)
  if (active == TRUE) cl <- paste0(cl, " is-active")


  shiny::tags$div(
    class = cl,
    # header
    shiny::tags$div(class = "plan-header", plan_title),
    # price
    shiny::tags$div(
      class = "plan-price",
      shiny::tags$span(
        class = "plan-price-amount",
        shiny::tags$span(class = "plan-price-currency", plan_currency),
        plan_price
      ),
      plan_period
    ),
    # items
    shiny::tags$div(
      class = "plan-items",
      # items
      ...
    ),
    # footer button
    shiny::tags$div(
      class = "plan-footer",
      shiny::tags$button(
        class = "button is-fullwidth",
        if (!is.null(button_status)) disabled = button_status,
        button_name
      )
    )
  )
}



#' @title bulma pricing plan item
#'
#' @description bulma item to insert in a bulmaPricingPlan container \url{https://wikiki.github.io/components/pricingtable/}.
#'
#' @param name Item name.
#'
#' @export
#'

bulmaPricingPlanItem <- function(name = NULL) {
  shiny::tags$div(class = "plan-item", name)
}
