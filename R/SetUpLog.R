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
#' @param console_echo Simple toggle
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
                       console_echo=FALSE){

  my_logfile <<- 'logfile.txt'
  time_stamp <<- date()

  if (file.exists(my_logfile)) unlink(my_logfile)
  writeLines(c(paste('logfile:',my_logfile),
               paste('#######################'),
               paste('R version:',sessioninfo()$R.version$version.string),
               paste('platform:',sessioninfo()$platform),
               paste('running:',sessioninfo()$running),
               paste('#----------------------'),
               paste('random number seed:',my_seed),
               paste('timestamp:',date()),
               paste('#----------------------'),
               paste('libraries loaded:'),
               paste(paste(sessioninfo::package_info("attached")$package),collapse=" "),
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

