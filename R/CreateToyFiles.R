# --------------------------------------
# FUNCTION create_toy_files
# required packages: none
# description: builds a set of toy files for batch operations
# inputs: folder_name = location of folders (create if non-existent)
#       : number_files = number of toy files to create (6 default)
#       : file_template = optional name and location of template file
# outputs: creates specified number of .csv files in folder location
########################################
#' Title
#'
#' @param folder_name name (and path) of new Toyfile folder to create. Default is "ToyFiles:="
#' @param number_files number of toy data files .csv to create. Default is 6 toy data files.
#' @param file_template
#' name (and path) of a .csv file that will be read and used as a template to create toy data files. Dimensions and column names are identical, but the elements of each column are randomized. Default creates a small data file with 2 character string columns, 1 integer column, and 4 real number columns. Files are named ToyFile_1.csv...
#' @returns creates folder and writes specified number of .csv files.
#' @export
#'
#' @examples
#' \dontrun{
#' create_toy_files()
#' create_toy_files(folder_name="ToyFiles2",
#' number_files=10,
#' file_template="OriginalData/FieldSurvey.csv")}
#'
create_toy_files <- function(folder_name="ToyFiles",
                             number_files=6,
                             file_template=NULL){

# check for old ToyFiles directory and delete it and contents
  if(dir.exists(folder_name)) unlink(folder_name, recursive=TRUE)
  dir.create(folder_name, recursive=TRUE)
  warning("Existing ",folder_name, " folder overwritten")

# assign parameter defaults
if (is.null(file_template)) {
for (i in 1:number_files){
  df <- data.frame(UpperCase=sample(LETTERS[1:4],
                                    size=25,
                                    replace=TRUE),
                   LowerCase=sample(letters[1:4],
                                    size=25,
                                    replace=TRUE),
                   RandomInt=sample(1:25),
                   RandomV1=runif(25),
                   RandomV2=runif(25),
                   RandomV3=runif(25),
                   RandomV4=runif(25))
  write.table(df,file=paste0(folder_name,"/","ToyFile_",i,".csv"),row.names=FALSE)}} else { df <- read.table(file=file_template, header=TRUE,sep=",")
  for (i in 1:number_files) {
  for (j in 1:ncol(df)) {
    df[j] <- sample(df[j])
  }
    write.table(df,file=paste0(folder_name,"/","ToyFile_",i,".csv"),row.names=FALSE)

}
  }




# function body




} # end of function create_toy_files
# --------------------------------------

# create_toy_files()
