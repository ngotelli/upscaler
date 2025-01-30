# --------------------------------------
# FUNCTION build_function
# required packages: stringr
# description: create a function in a new named script
# inputs: vector of name of function(s),
#   file name suffix (default=".R"),
#   file name prefix (default="Functions/")
# outputs: named script file(s) containing named function template(s)
########################################
#' Create an R Script For a New Function
#'
#' Creates one or more template files for new functions in a designated folder.
#' By default, templates will be saved in the \emph{"Functions/"} folder, as
#' created by the \code{\link{add_folder}} function.
#'
#' @param function_name Vector of character strings of the names of functions to
#'   add. Each function name must be written in snake case formatting, with all
#'   lower case letters and words separated by a single underscore character
#'   (example: \emph{"my_function_name"}). Do not include function parentheses
#'   or other characters or spaces. If not provided, the file name will be created by
#'   converting the function name from snake case to Pascal (Upper Camel) Case.
#'   For example, the function name \code{my_function} will be converted to the file name
#'   \emph{"MyFunction"}.
#' @param file_prefix Optional file prefix name, which would specify a folder
#'   address. If not provided, the default value is \emph{"Functions/"}. In
#'   other words, the file name becomes \emph{"Functions/MyFunction.R"}, which
#'   will be created in a subfolder called \emph{"Folders"}. Folders are created
#'   with the default values of the \code{\link{add_folder}} function, which
#'   should be run first.
#' @param file_suffix Optional file suffix name. The default suffix is .R, so
#'   this should usually not be changed. Beginning with the required function
#'   name \code{build_function("special_task")} would create a skeleton function
#'   script file called \emph{"SpecialTask.R"}, and this script file would be
#'   created inside of the \emph{"Functions"} folder.
#'
#' @return An R script file for each function name provided. Unless specified,
#'   these script files will be placed in the \emph{"Functions"} subfolder.
#'
#' @seealso \code{\link{add_folder}}
#'
#' @export
#'
#' @examples
#' \dontrun{
#' build_function("special_task")
#' build_function("meta_data_notes",file_suffix=".txt")
#' }
#'
build_function <- function (function_name,
                             file_prefix="Functions/",
                             file_suffix=".R") {

   # function body
  file_name <- rep(NA,length(function_name))
  for (i in seq_along(function_name)) {

    # create file name
      file_name[i] <- gsub("_"," ",function_name[i])
      file_name[i] <- stringr::str_to_title(file_name[i])
      file_name[i] <- gsub(" ","",file_name[i])

    # use default prefix if none provided, add trailing "/" if none provided
    if (is.null(file_prefix)) {
      file_prefix <- "Functions/"
    } else if (grepl("/$", file_prefix) == FALSE) {
      file_prefix <- paste0(file_prefix, "/")
    }

    if (is.null(file_suffix)) file_suffix <- ".R"

    file_name[i] <- paste0(file_prefix,file_name[i],file_suffix)

    if(file.exists(file_name[i])) stop(file_name[i],' already exists!')

    utils::write.table(cat("# --------------------------------------","\n",
                    "# FUNCTION ",function_name[i],"\n",
                    "# required packages: none","\n",
                    "# description:","\n",
                    "# inputs:","\n",
                    "# outputs:","\n",
                    "########################################","\n",
                    function_name[i]," <- function(x=NULL,y=NULL){", "\n",
                    "\n",
                    "# assign parameter defaults","\n",
                    "if (is.null(x) | is.null(y)) {", "\n",
      "  x <- runif(10)", "\n",
      "  y <- runif(10)", "\n",
                                    "}", "\n",
    "\n",
                    "# function body","\n",
                    "\n",
                    "\n",
                    "\n",
                    "return(print('...checking function: ",function_name[i],"()'))", "\n",
                    "\n",
                    "} # end of function ",function_name[i],"\n",
                    "# --------------------------------------","\n",
                    "# ", function_name[i],"()","\n",
                    file=file_name[i],
                    row.names="",
                    col.names="",
                    sep="",
                    append=TRUE))
    cat('Function file "', file_name[i],'" built.','\n',sep='')
  }
} # end of build_function
# --------------------------------------
# build_function()
