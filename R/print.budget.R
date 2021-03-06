#' Prints a clean version of a budget
#'
#' \code{print.budget} prints a clean version of a budget.
#'
#' @param x A budget.
#' @param ... Does nothing.  Included only to use the print generic.
#' @export

print.budget <- function(x, ...) {
    writeLines("budget (budgetr)")
    print(x$df, row.names=FALSE)
    invisible(NULL)
}
