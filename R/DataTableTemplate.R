# --------------------------------------
# FUNCTION data_table_template
# required packages: none
# description: creates a simple csv file to hold a data frame as a table
# inputs: data frame
# outputs: .csv file with the data frame, legend, and timestamp
########################################
data_table_template <- function(data_frame=NULL,file_name=NULL) {
  
  # function body
  
  oldw <- getOption("warn")
  options(warn = -1) # temporarily turn off warnings
  
  # create example data frame
  if (is.null(data_frame)) {
    Species <- c("Species_A","Species_B")
    Control <- signif(runif(2),digits=3)
    Low <- signif(runif(2),digits=3)
    High <- signif(runif(2),digits=3)
    data_frame <- data.frame(Species,Control,Low,High)
  }
  
  # create example data file
  if (is.null(file_name)) {
    file_name <- ("ToyDataTable.csv")
  }
  if (file.exists(file_name)) stop(file_name," already exists!") else  {
  # set up data file and incorporate time stamp and minimal metadata
  write.table(cat("# Table X. Table legend","\n",
                  "# ","\n",
                  "# timestamp: ",format(Sys.time(), "%d %B %Y %X"),"\n",
                  "# ------------------------", "\n",
                  "\n",
                  file=file_name,
                  row.names="",
                  col.names="",
                  sep=""))

  # now add the data frame
  write.table(x=data_frame,
              file=file_name,
              sep=",",
              row.names=FALSE,
              append=TRUE)
                                  }
  options(warn = oldw) # restore warnings  
}

 # end of data_table_template
# --------------------------------------
# data_table_template()
