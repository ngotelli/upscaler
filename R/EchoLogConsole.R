# --------------------------------------
# FUNCTION echo_log_console
# required packages:log4r
# description: toggle on and off echo console
# inputs: toggle=TRUE for log+console, FALSE for log only
# outputs: changes log outputs
########################################
#' Toggle Log File Messages to Echo to Console
#'
#' @param toggle Logical variable setting whether log messages are echoed
#' in the console (\code{TRUE}) or sent only to the log file (\code{FALSE}).
#' Default is \code{FALSE}. Can be toggled at any point in a script.
#'
#' @return Toggles the switch.

#' @export
#'
#' @examples
#' \dontrun{
#' echo_log_console(TRUE)
#' }
#'
echo_log_console <- function(toggle=FALSE) {

  if(toggle==TRUE) output <<- list(my_console_appender,my_file_appender) else {
    output <<- list(my_file_appender)
  }

  my_logger <<- log4r::logger(threshold = "INFO",
                              appenders=output)

} # end of function echo_log_console
# --------------------------------------
# echo_log_console()
