# --------------------------------------
# FUNCTION source_batch
# required packages: none
# description: automates sourcing of multiple R script files
# inputs: folder name containing .R script files
# outputs: individual scripts sourced
########################################
#' Batch Sourcing of Multiple R script files
#'
#' @param folder Name of subfolder that contains R scripts to be sourced.
#' This folder name could be expanded to a path statement to source script
#' files in other locations. Scripts are sourced in alphabetical order
#' of their names. The function is not recursive so scripts contained within
#' subfolders are not sourced. The function fails if no folder is given,
#' if the folder does not exist, or if it is empty.
#' @param filetype Pattern to specify file type. Default is \emph{"*.R$"}.
#' To source all of the files in a folder as R scripts,
#' even if they do not contain the \emph{".R"} suffix, use \emph{"*.*$"}
#'
#' @return Runs the \code{source()} function on each R script file
#' contained in the folder.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' source_batch("Functions")
#' }
#'
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
