# --------------------------------------
# FUNCTION create_padded_labels
# required packages: none
# description: creates character string labels with padded zeroes
# inputs: number of labels, character string, optional file name suffix
# outputs: vector of labels (or file names)
########################################
#' Create a Vector of Labels
#'
#' Create a vector of character strings with padded, consecutive numbering.

#' @param n Number of labels to create.
#' @param string Character string for label.
#' @param suffix Optional character string suffix for file type.
#'
#' @return Vector of character strings with consecutive, padded labels.
#'     These labels could be names for vectors or file names.
#'     Padding of numeric values with leading zeroes ensures that
#'     file names will display in correct consecutive order in a file
#'     explorer (e.g. "Species09.csv" before "Species10.csv")
#' @export
#'
#' @examples
#' create_padded_labels()
#' create_padded_labels(n = 4,string = "Species")
#' create_padded_labels(n = 7,string= "Site" ,suffix = ".csv")
create_padded_labels <- function(n=6,
                                 string="Toy",
                                 suffix=NULL) {

# function body

  my_labels <-  paste0(string,formatC((1:n),
                                     width=max(c(3,nchar(as.character(n)))),
                                     format="d",
                                     flag="0"))
  if (!is.null(suffix)) my_labels <- paste0(my_labels,suffix)

return(my_labels)

} # end of create_padded_labels
# --------------------------------------
# create_padded_labels(suffix=".csv")
