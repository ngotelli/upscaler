# --------------------------------------
# FUNCTION set_up_log
# required packages:log4r
# description: set up logging system
# inputs: name and address of logfile
# outputs: logfile
########################################
#' Set Up Log File
#'
#' @param my_logfile Character string for log file name.
#' Default is \emph{logfile.txt}.
#' @param console_echo Calls function \code{echo_log_console()}. Default
#' setting is \code{FALSE} so log messages are not toggled to console.
#' @param overwrite_log Logical variable that specifies whether
#' the log file should be overwritten (\code{TRUE}) or preserved
#'  with a unique file name that is pre-pended with a time stamp (\code{FALSE}). The default is \code{TRUE}, so there is a
#'  single log file whose contents are refreshed very time the
#'  script is run. Change this to \code{FALSE} only if you are
#'  using the log messages to help debug a program and you want
#'  to preserve a distinctly named log file every time the script is
#'  executed. In this case, the file name has a 6 digit prefix
#'  pre-pended to it in the form \emph{"HHMMSS-my_logfile"}.
#'  The six digits represents the hours (HH), minutes (MM),
#'  and seconds (SS) taken from the time stamp,
#'  followed by a hyphen and the log file
#'  name (either user-supplied, or the default \emph{"logfile.txt"}
#'
#' @return Creates log file.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' set_up_log()
#' }
#'
set_up_log <- function(my_logfile='logfile.txt',
                       console_echo=FALSE,
                       overwrite_log=TRUE){

  #------------------------ new fork
  if(!exists("my_seed"))initiate_seed()
  #---------------------------
  time_stamp <<- date()
  if(overwrite_log==FALSE) {
  log_stamp <- substr(time_stamp,12,19)
  log_stamp <- gsub(":", "", log_stamp)
  my_logfile <- paste0(log_stamp,"-",my_logfile) }
  my_logfile <<- my_logfile

  if (file.exists(my_logfile)) unlink(my_logfile)
  writeLines(c(paste('logfile:',my_logfile),
               paste('#######################'),
               paste('R version:',sessionInfo()$R.version$version.string),
               paste('platform:',sessionInfo()$platform),
               paste('running:',sessionInfo()$running),
               paste('#----------------------'),
               paste('random number seed:',my_seed),
               paste('timestamp:',date()),
               paste('#----------------------'),
               paste('libraries loaded:'),
               # paste(paste(sessioninfo::package_info("attached")$package),collapse=" "),
               paste('#######################')),
             my_logfile)


  my_console_appender <<- log4r::console_appender(layout = log4r::default_log_layout(time_format="%d-%b %H:%M:%S"))

  my_file_appender <<- log4r::file_appender(my_logfile, append = TRUE,
                                            layout = log4r::default_log_layout(time_format="%d-%b %H:%M:%S"))
  output <<- list(my_console_appender,my_file_appender)
  if (!console_echo) output <<- list(my_file_appender)

  my_logger <<- log4r::logger(threshold = "INFO",
                              appenders=output)
} # end of function setup_log
# set_up_log()

