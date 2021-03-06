#' Gets items in the current environment
#'
#' \code{get_items} returns a list of budget items matching the specified pattern.
#'
#' @param pattern A regular expression describing the names of objects to check.  Defaults to
#'     all objects
#' @param env The environment to look for items.  Defaults to the calling environment.
#' @return The output of \code{create_item} is a list of budget items matching the specified pattern.
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
#'
#' # Get all items
#' get_items()
#'
#' # Get only items matching "rent"
#' get_items("rent")

get_items <- function(pattern=".", env=parent.frame()) {
    # Get objects matching pattern
    ls_pattern <- ls(env, pattern=pattern)

    # Error if no objects
    if (length(ls_pattern) == 0) {
        error_msg <- paste0( "There are no objects in your current environment matching the pattern "
                           , "'", pattern, "'"
                           )
        stop(error_msg, call.=FALSE)
    }

    # Get names of item objects
    ls_items <- sapply(ls_pattern, function(x) is.item(get(x, env)))
    ls_items <- names(ls_items[ls_items])

    # Error if no items
    if (length(ls_items) == 0) {
        error_msg <- paste0( "There are no items in your current environment matching the pattern "
                           , "'", pattern, "'"
                           )
        stop(error_msg, call.=FALSE)
    }

    # Create list of items
    list_items <- lapply(ls_items, function(x) get(x, env))
    names(list_items) <- ls_items
    list_items
}
