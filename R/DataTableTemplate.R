# --------------------------------------
# FUNCTION data_table_template
# required packages: none
# description: creates a simple csv file to hold a data frame as a table
# inputs: data frame
# outputs: .csv file with the data frame, legend, and timestamp
########################################
#' Create a Template for an Annotated csv Data File
#'
#' Generates a .csv file template for proper meta-data documentation in a data frame.

#' @param data_frame Name of the data frame to add to the template
#' @param file_name Name of the csv data file, which will be saved to disk as filename.csv
#'
#' @return Named .csv file.
#'     This template displays the data frame as a simple table
#'     with minimal meta-data at the top, but the same format could
#'     be greatly expanded to create a properly annotated data file
#'     for long-term storage as a .csv file. Use this function
#'     to create a .csv file for every summary table that will
#'     be included in your manuscript or final project, even if
#'     the data content is text. In this way your project will
#'     store all of the pieces of your work.
#'     R will ignore lines that begin with a hashtag,
#'     so the .csv file that is created by this function
#'     could be read back into R with
#'     read.table(file="ToyDataTable.csv,
#'     header=TRUE,sep=",").
#'
#' @export
#'
#' @examples
#' data_table_template()
#'
data_table_template <- function(data_frame=NULL,file_name=NULL) {

  # function body

  oldw <- getOption("warn")
  options(warn = -1) # temporarily turn off warnings

  # create example data frame
  if (is.null(data_frame)) {
    Species <- c("Species_A","Species_B")
    Control <- signif(stats::runif(2),digits=3)
    Low <- signif(stats::runif(2),digits=3)
    High <- signif(stats::runif(2),digits=3)
    data_frame <- data.frame(Species,Control,Low,High)
  }

  # create example data file
  if (is.null(file_name)) {
    file_name <- ("ToyDataTable.csv")
  }
  if (file.exists(file_name)) stop(file_name," already exists!") else  {
    # set up data file and incorporate time stamp and minimal metadata
    utils::write.table(cat("# Table X. Table legend","\n",
                    "# ","\n",
                    "# timestamp: ",format(Sys.time(), "%d %B %Y %X"),"\n",
                    "# ------------------------", "\n",
                    "# ","\n",
                    file=file_name,
                    row.names="",
                   col.names="",
                    sep=""))

    # now add the data frame
    utils::write.table(x=data_frame,
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
