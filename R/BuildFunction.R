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

write.table(cat("# --------------------------------------","\n",
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
                "return(message('...checking function: ",function_name[i],"()'))", "\n",
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