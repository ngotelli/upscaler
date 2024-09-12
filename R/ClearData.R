# --------------------------------------
# FUNCTION clear_data
# required packages: utils
# description: remove data objects from the global environment
# inputs: vector of names of objects to be kept
# outputs: all data objects that were not specified as kept are removed
########################################
#' Remove data objects from the global environment
#'
#' @param keep the names of objects to keep, either as a character string or
#'   vector of character strings. If NULL, all data objects will be removed.
#'
#' @description \code{clear_data()} wraps around \code{rm()} to remove data
#'   objects from the global environment, but does not remove sourced functions.
#'   It is a convenient function to put at the end of modular scripts to shed
#'   any errant objects.
#'
#' @details It is important to note that this function does not provide a clean
#'   slate restart of R. Full resets should be performed liberally, either by
#'   closing and restarting R or using "CTRL/CMD + SHIFT + F10". Clearing
#'   objects from the environment does not achieve this. Rather,
#'   \code{clear_data()} is meant to be used at the end of modular scripts.
#'   Pertinent objects can either be saved to .rds or by using the \code{keep}
#'   argument, while all other data objects will be removed.
#'
#' @return Global objects which are not functions are removed from the
#'   environment.
#'
#' @importFrom utils lsf.str
#'
#' @export
#'
#' @examples
#' # Remove all data objects
#' x <- 3
#' y <- "apple"
#' clear_data()
#'
#' # Keep one data object
#' x <- 3
#' y <- "apple"
#' z <- TRUE
#' clear_data('x')
#'
#' # Keep multiple data objects
#' x <- 3
#' y <- "apple"
#' z <- TRUE
#' clear_data('x', 'y')
clear_data <- \(keep = NULL) {
  stopifnot("keep argument must be a character" = is.character(keep) | is.null(keep))
  all_data_objects <- setdiff(ls(envir = .GlobalEnv), lsf.str(envir = .GlobalEnv))
  remove_list <- setdiff(all_data_objects, keep)
  rm(list = remove_list, envir = .GlobalEnv)
}
