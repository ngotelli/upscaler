# --------------------------------------
# FUNCTION initiate_seed
# required packages: TeachingDemos
# description: create a reproducible seed
# inputs: none
# outputs: my_seed
########################################
#' Select, set, and store random number seed.
#'
#' @param user_seed Takes as input a random number seed from the user,
#' stores it, and sets the random number seed with the \code{set.seed()}
#' function. In the default state, the user does not provide a seed.
#' Instead, the function randomly selects an integer in the range +- 1e+9,
#' stores it, and invokes the \code{set.seed()}. This seed is recorded
#' in the log file each time the script is run. Automating the choice
#' of the random number seed avoids the problem that most users
#' select a seed that is very small (typically < 1e+3) compared
#' to the range of possible seed values that could be used (+- 1e+9).
#'
#' @return A randomly chosen integer (+- 1e+9) that
#' is internally stored, recorded, and passed
#' to the \code{set.seed()} function.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' initiate_seed()
#' initiate_seed(99)
#' }
#'
initiate_seed <- function(user_seed=NULL) {
# function body

if (!is.null(user_seed)) {
  my_seed <<- user_seed
  set.seed(my_seed)
} else {
  my_seed <<- sample(1:1000000000,1)
  if(stats::runif(1)<0.5) my_seed <<- -1*my_seed
  set.seed(my_seed)
}
} # end of initiate_seed
# -------------------
# initiate_seed()
