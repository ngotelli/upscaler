# --------------------------------------
# FUNCTION add_folder
# required packages: none
# description: create folders for an r project
# inputs: optionally, a vector of folder names; default is Nick's folder choices
# outputs: a set of folders (but not if they already exist)
########################################
add_folder <- function(folder_names=NULL) {

# function body
  
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

