# --------------------------------------
# FUNCTION build_function
# required packages: stringr
# description: create a function in a new named script
# inputs: vector of name of function(s),
#   name of script (optional,
#   created from function name snake_case to PascalCase)
#   file name suffix (default=".R"),
#   file name prefix (default="Functions/")
# outputs: named script file(s) containing named function template(s)
########################################
#' Create an R Script For a New Function
#'
#' @param function_name Vector of character strings of the names of
#' functions to add. Each function name must be written in camel case
#' formatting, with all lower case letters and words separated
#' by a single underscore character (example: \emph{"my_function_name"}).
#' Do not include function parentheses or other characters or spaces.
#' @param file_name Optional file name for the R script that
#' will contain function. If not provided,
#' the file name will be created by converting the function name
#' from camel case to Pascal Case. For example, the function name
#' \code{my_function} will be converted to the file name \emph{"MyFunction"}.
#' @param file_prefix Optional file prefix name, which would specify a
#' folder address. If not provided, the default value is \emph{"Functions/"}.
#' In other words, the file name becomes \emph{"Functions/MyFunction.R"},
#'  which will be created in a subfolder called \emph{"Folders"}.
#'  Folders is created with the default values of the \code{add_folders()}
#'  function, which should be run first.
#' @param file_suffix Optional file suffix name. The default suffix
#' is .R, so this should usually not be changed. Beginning with the
#' required function name \code{build_function("special_task")}
#' would create a skeleton function script file called
#' \emph{"SpecialTask.R"}, and this script file would be created
#' inside of the \emph{"Functions"} folder.
#'
#' @return An R script file for each function name provided. Unless
#' specified, these script files will be placed in the
#' \emph{"Functions"} subfolder.
#' @export
#'
#' @examples
#' build_function("special_task")
#' build_function("meta_data_notes,file_suffix=".txt")
build_function <- function (function_name=NULL,
                             file_name=NULL,
                             file_prefix=NULL,
                             file_suffix=NULL) {

# function body
if (is.null(function_name)) function_name <- "toy_example"

for (i in seq_along(function_name)) {
  file_name[i] <- gsub("_"," ",function_name[i])
  file_name[i] <- stringr::str_to_title(file_name[i])
  file_name[i] <- gsub(" ","",file_name[i])

if (is.null(file_prefix)) file_prefix <- "Functions/"
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
