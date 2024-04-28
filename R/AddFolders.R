# --------------------------------------
# FUNCTION add_folder
# required packages: none
# description: create folders for an r project
# inputs: optionally, a vector of folder names; default is Nick's folder choices
# outputs: a set of folders (but not if they already exist)
########################################
#' Create Folders
#'
#' @param folder_names Character string vector of folder names to create.
#'  If no folder names are provided, the default folders
#'  created in the current location (usually a project) are: c("OriginalData",
#'  "CleanedData","Scripts","Functions","Plots","Outputs","DataObjects",
#'  "Markdown").Each folder that is created is empty, but does contain a hidden.
#'  empty file name, so that the empty folders will not be erased by github
#'  before anything is added to them. The function always checks to make sure
#'  the folder does not already exist, so it will not over-write existing
#'  folders or files in the current location.
#'
#' @return Set of folders created in the current location.
#' @export
#'
#' @examples
#' \dontrun{
#' add_folder()
#' add_folder(folder_names=c("MyFolder","MyFolder2"))
#' }

# function body

add_folder <- function(folder_names=NULL) {
if(is.null(folder_names)) {folder_names <- c("OriginalData",
                  "CleanedData",
                  "Scripts",
                  "Functions",
                  "Plots",
                  "Outputs",
                  "DataObjects",
                  "Markdown")
}
# build the folders
for (i in seq_along(folder_names)) {
  if (dir.exists(folder_names[i])) stop("folder ",folder_names[i],
                                       " already exists!") else {dir.create(folder_names[i])
                                             cat("folder ","'",folder_names[i],"'",
                                             " created",sep="",
                                             "\n")
                                       }
}
# add the hidden files
for (i in seq_along(folder_names)) {
  if (!file.exists(paste0(folder_names[i],"/.keep"))) file.create(paste0(folder_names[i],"/.keep"))

}


} # end of add_folder
# --------------------------------------
# add_folder()

