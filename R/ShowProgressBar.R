# --------------------------------------
# FUNCTION show_progress_bar
# required packages: none
# description: creates old-school terminal progress bar
# inputs: index = variable used in for loop (such as i,j,k)
#         counter = numeric label for interval
#         dot_increment = number of loops represented by a "."
# outputs: row of dots and numbers as for loop progresses
########################################
#' Show Progress Bar
#'
#' @param index integer variable used for counter within a loop
#' (typically \emph{i}, \emph{j}, or \emph{k}). The default value is \emph{i}.
#' @param counter Numeric label for the interval. This value will increment
#' a counter number that is displayed in the console.
#' The default value is 10,
#'  so the console will display 10,20,30,... when these repititions are
#'  reached in the for loop.
#' @param dot Increment value for each dot. The default value is 1, so a dot
#' is displayed for each pass through the for loop, with integers printed
#' after 9 consecutive dots (for the default value of counter=10).
#'
#' @return While a for loop is running, displays progress bar on the console, which is echoed to the log file.
#' @export
#'
#' @examples
#' \dontrun{
#' for (i in 1:100) {
#'    <for loop commands>
#'    show_progress_bar()
#'    }
#'
#' for (j in 1:10000) {
#'    <for loop commands>
#'    show_progress_bar(index=j, counter=500, dot=50)
#'    }
#'  }
show_progress_bar <- function(index=i,
                              counter=10,
                              dot=1){

  # function body

  if(index%%counter==0) {cat(index)
    cat(index,file=my_logfile,append=TRUE)}else if(index%%dot==0) {cat('.')
      cat('.',file=my_logfile,append=TRUE)
    }

} # end of function show_progress_bar
# --------------------------------------
# show_progress_bar()
