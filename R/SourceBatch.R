# --------------------------------------
# FUNCTION source_batch
# required packages: none
# description: automates sourcing of multiple R script files
# inputs: folder=folder name containing .R script files
#       : subset=optional character string vector of
#         ordered subset of .R script files contained within the folder
#         the default subset="" sources all files in folder in alphabetical order
#       : filetype=optional character string for suffix
#
# outputs: sources individual script files
########################################
#' Batch Sourcing of Multiple R script files
#'
#' @param folder Name of subfolder that contains R scripts to be sourced.
#' This folder name could be expanded to a path statement to source script
#' files in other locations. Scripts are sourced in alphabetical order
#' of their names (unless parameter subset is specified.
#' The function is not recursive so scripts contained within
#' subfolders are not sourced. The function fails if no folder is given,
#' if the folder does not exist, or if the folder is empty.
#' @param subset Ordered character string vector specifying which R scripts
#' should be sequentially sourced.
#' The default subset="" sources all R scripts in the folder in alphabetical order.
#' @param filetype Pattern to specify file type. Default is \emph{"*.R$"}.
#' To source all of the files in a folder as R scripts,
#' even if they do not contain the \emph{".R"} suffix, use \emph{"*.*$"}
#'
#' @return Runs the \code{source()} function on each R script file
#' contained in the folder (or in the ordered list given by subset).
#'
#' @export
#'
#' @examples
#' \dontrun{
#' source_batch(folder="Functions")
#' source_batch(folder="Functions",
#'        subset=c("Prelims.R","Core.R","Coda.R"))
#' }
#'
source_batch <- function(folder=NULL, subset="",filetype="*.R$"){

  # function body
  if (is.null(folder)) stop("folder name not provided!") else if(!dir.exists(folder)) stop("folder ",folder," does not exist!") else if(length(list.files(folder,pattern=filetype))<=0) stop("folder ",folder," has no ", filetype, " files!") else {

    my_scripts <- list.files(folder, pattern=filetype)
    if(subset[1]!="") my_scripts <- subset
    for (i in seq_along(my_scripts)) {
      source(file=paste0(folder,"/",my_scripts[i]))
      message('File "', folder,'/', my_scripts[i],'" sourced.')
    }
  }
} # end of function source_batch
# --------------------------------------
# source_batch()




