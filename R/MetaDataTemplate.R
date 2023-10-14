# --------------------------------------
# FUNCTION metadata_template
# required packages: none
# description: creates template with metadata for data entry
# inputs: file name
# outputs: .csv file with metadata
########################################
metadata_template <- function(file_name=NULL) {

# function body
if (is.null(file_name)) {
  file_name <- "MetaDataTemplate.csv"
  }
if (file.exists(file_name)) stop(file_name, " already exists!") else  {
  write.table(cat("#//////////////////////////////","\n",
                  "#---START OF METADATA---","\n",
                  "#------------------------------","\n",
                  "# TITLE: Brief title for entire data set","\n",
                  "# CREATION TIMESTAMP: ",format(Sys.time(), "%d %B %Y %X"),"\n",
                  "# AUTHOR: author/owner of data","\n",
                  "#------------------------------","\n",
                  "# AUTHOR EMAIL:","\n",
                  "# AUTHOR ADDRESS:","\n",
                  "# AUTHOR WEBSITE:","\n",
                  "#------------------------------","\n",
                  "# OWNERSHIP: Information on who owns/controls the data","\n",
                  "","\n",
                  "# COLLABORATORS: One or more lines identifying others who collected/own data","\n",
                  "# FUNDING SOURCES: Grant numbers or funding sources for acknowlegment","\n",
                  "# REPOSITORY: One or more lines for GitHub, Dryad, or permanent web repositories where data set can be accessed","\n",
                  "# CITATIONS: One or more lines for publications that cite or use these data","\n",
                  "","\n",
                  "#------------------------------","\n",
                  "# SAMPLING LOCATIONS: One or more lines about where data were collected; GPS for individual sites should be data columns","\n",
                  "# SAMPLING TIMES: One more lines on when data were collected","\n",
                  "# VARIABLE DESCRIPTION: One line for each column in the data set stating what it is and what the units of measurement are","\n",
                  "# MISSING DATA: One or more lines for each variable describing the source of NA values throughout","\n",
                  "#------------------------------","\n",
                  "# DATA TRACK CHANGES LOG (use this section to record any changes to the data set after it is created)","\n",
                  "# DATE:,CHANGES:	","\n",
                  "# DATE:,CHANGES:	","\n",
                  "# DATE:,CHANGES:	","\n",
                  "# DATE:,CHANGES:	","\n",
                  "#------------------------------","\n",
                  "#---END OF METADATA---","\n",
                  "#//////////////////////////////","\n",
                  "#","\n",
                  "#","\n",
                  "#---START OF DATA---","\n",
                  "#","\n",
                  "ID,VarOne,VarTwo,VarThree,TextNotes","\n",
                  "","\n",
                  "","\n",
                  "","\n",
                  "# Can insert comments throughout text to add notes for individual data rows","\n",
                  "","\n",
                  "","\n",
                  "#---END OF DATA---","\n",
                  file=file_name,
                  row.names="",
                  col.names="",
                  sep=""))
}

} # end of metadata_template
# --------------------------------------
# metadata_template()