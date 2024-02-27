# --------------------------------------
# FUNCTION source_batch
# required packages: none
# description: automates sourcing of multiple R script files
# inputs: folder name containing .R script files
# outputs: individual scripts sourced
########################################
source_batch <- function(folder=NULL,filetype="*.R$"){

# function body
if (is.null(folder)) stop("folder name not provided!") else if(!dir.exists(folder)) stop("folder ",folder," does not exist!") else if(length(list.files(folder,pattern=filetype))<=0) stop("folder ",folder," has no ", filetype, " files!") else {
  
my_scripts <- list.files(folder, pattern=filetype)
  for (i in seq_along(my_scripts)) {
    source(file=paste0(folder,"/",my_scripts[i]))
    cat('File "', folder,'/', my_scripts[i],'" sourced.','\n',sep='')
  }
  }
} # end of function source_batch
# --------------------------------------
# source_batch()
