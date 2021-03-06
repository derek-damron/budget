#' Updates a budget
#'
#' \code{update_budget} returns an updated budget.
#'
#' @param budget The budget to be updated.
#' @param start The new start date for the budget (if applicable).
#' @param end The new end date for the budget (if applicable).
#' @param initial The new initial amount for the budget (if applicable).
#' @return The output of \code{update_budget} is a new budget with the specified updates.
#' @export
#' @examples
#' # Create a paycheck item
#' paycheck <- create_item( name = "Paycheck"
#'                        , amount = 1000
#'                        , day = "2016-01-01"
#'                        , recurring = "monthly"
#'                        )
#' # Create a rent item
#' rent <- create_item( name = "Rent"
#'                    , amount = -500
#'                    , day = "2016-01-05"
#'                    , recurring = "monthly"
#'                    )
#' # Create a schedule
#' my_schedule <- create_schedule(paycheck, rent)
#' # Create a budget
#' my_budget <- create_budget(my_schedule, start="2016-01-01", initial=1000)
#' # Inspect
#' my_budget
#'
#' # Update the initial amount
#' my_budget <- update_budget(my_budget, initial=0)
#' # Inspect
#' my_budget

update_budget <- function(budget, start, end, initial) {
    # Check budget
    if (missing(budget)) {
        stop("Please provide a budget to update", call.=FALSE)
    } else if (!is.budget(budget)) {
        stop("budget must be a budget", call.=FALSE)
    }

    # Check start
    if (missing(start)) {
        start <- budget$args$start
    }

    # Check end
    if (missing(end)) {
        end <- budget$args$end
    }

    # Check initial
    if (missing(initial)) {
        initial <- budget$args$initial
    }

    # Update budget
    create_budget( schedule = budget$schedule
                 , start = start
                 , end = end
                 , initial = initial
                 )
}
