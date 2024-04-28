# --------------------------------------
# FUNCTION l
# required packages:log4r
# description: make a log statement
# inputs: message, with optional index for 4 loop use
# outputs: message to log
########################################
#' Pass Messages to Log File
#'
#' @param log_entry Text message to pass to log file. The default is
#' no message, in which case only the time stamp is entered in the log.
#'
#' @return Message sent to log.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' l('Text message for log')
#' }
#'
l <- function(log_entry="") {
  f <- file(my_logfile, "r")
  l <- tryCatch(readLines(f), warning = function(w) w)
  close(f)

  if(inherits(l, "warning")){
    if(grepl("incomplete final line found", l$message)){
      f <- file(my_logfile, "a")
      writeLines("", f)
      close(f)
    }
  }


  log4r::info(my_logger, log_entry)
} # end of function l
# l('my message')

