% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AddFolders.R
\name{add_folder}
\alias{add_folder}
\title{Create Folders}
\usage{
add_folder(folder_names = NULL)
}
\arguments{
\item{folder_names}{Character string vector of folder names to create.
If no folder names are provided, the default folders
created in the current location (usually a project) are: c("OriginalData",
"CleanedData","Scripts","Functions","Plots","Outputs","DataObjects",
"Markdown").Each folder that is created is empty, but does contain a hidden.
empty file name, so that the empty folders will not be erased by github
before anything is added to them. The function always checks to make sure
the folder does not already exist, so it will not over-write existing
folders or files in the current location.}
}
\value{
Set of folders created in the current location.
}
\description{
Create Folders
}
\examples{
\dontrun{
add_folder()
add_folder(folder_names=c("MyFolder","MyFolder2"))
}
}
