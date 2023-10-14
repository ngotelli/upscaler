# --------------------------------------
# FUNCTION set_up_log
# required packages:log4r 
# description: set up logging system
# inputs: name and address of logfile
# outputs: logfile
########################################
set_up_log <- function(my_logfile='logfile.txt',
                       console_echo=FALSE){

   my_logfile <<- 'logfile.txt'
   time_stamp <<- date()
  
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

# --------------------------------------
# FUNCTION l
# required packages:log4r 
# description: make a log statement
# inputs: message, with optional index for 4 loop use
# outputs: message to log
######################################## 
l <<- function(log_entry="") {
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

  
# --------------------------------------
# FUNCTION echo_log_console
# required packages:log4r 
# description: toggle on and off echo console
# inputs: toggle=TRUE for log+console, FALSE for log only
# outputs: changes log outputs
######################################## 
    echo_log_console <<- function(toggle=FALSE) {
      
      if(toggle==TRUE) output <<- list(my_console_appender,my_file_appender) else {
        output <<- list(my_file_appender)
      }

      my_logger <<- log4r::logger(threshold = "INFO", 
                                  appenders=output)

} # end of function echo_log_console
# --------------------------------------
# echo_log_console()

    # --------------------------------------
    # FUNCTION show_progress_bar
    # required packages: none
    # description: creates old-school terminal progress bar
    # inputs: index = variable used in for loop (such as i,j,k)
    #         counter = numeric label for interval 
    #         dot_increment = number of loops represented by a "."
    # outputs: row of dots and numbers as for loop progresses
    ########################################
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