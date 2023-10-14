# Strategic Coding Practices 
# Script illustrating barracudar functions
# Nicholas J. Gotelli
# University of Vermont
# 19 July 2023
#
# load packages ----
library(log4r)
library(TeachingDemos)
library(tidyverse)
library(pracma)
library(ggmosaic)
# load any additional packages here...


# source function files ----
source("barracudar/DataTableTemplate.R")
source("barracudar/AddFolder.R")
source("barracudar/BuildFunction.R")
source("barracudar/MetaDataTemplate.R")
source("barracudar/CreatePaddedLabel.R")
source("barracudar/InitiateSeed.R")
source("barracudar/SetUpLog.R")
source("barracudar/SourceBatch.R")

source("barracudar/QBox.R")
source("barracudar/QCon1.R")
source("barracudar/QCon2.R")
source("barracudar/QHist.R")
source("barracudar/QLogis.R")
source("barracudar/QScat.R")
source("barracudar/QBub.R")
source("barracudar/QContour.R")

# source any additional scripts here...

# set random number seed ----

initiate_seed() # preserves random number seed
# initiate_seed(user_seed=NULL)
# initiate_seed(user_seed=999) # user-defined seed for set.seed()

# set up log files ----

set_up_log()
# set_up_log(my_logfile='logfile.txt',
#            console_echo=FALSE)
#===================================================
# commands above this line should be executed first, in this order
#===================================================

# Presentation Outline ----
# 1. Organization of Project: add_folders() ----
# add_folder(folder_names=NULL)
add_folder() # create typical folders for workflow
add_folder("MyUniqueFolder") # use for your own groupings


## 1.1 OriginalData ----

# -start with primary .csv files or text files with links and meta pointing to rasters, images, or files too large to store on disk
# -never ever edit anything in original data folder!
  
### 1.1.1 Embed Your MetaData In Your DataFile: metadata_template() ----

# metadata_template(file=NULL)
metadata_template(file="OriginalData/MyData.csv")

# show real-world example

## 1.2 CleanedData ----
# -copy everything from Original Data folder and only do editing here
# -“dirty” data cannot be opened or read
# -not all data cleaning can be easily documented
# -additional cleaning and wrangling after texts are created

## 1.3 Scripts ----
# - contains standard R scripts
# - may contain only a single MainScript.R with global variables and function calls

## 1.4 Functions ----
# - contains scripts for user-defined functions
# - these functions may be contained in a single script
# - more portability and ease of programming to create a single script for each function

## 1.5 Plots ----
# - contains .jpg, .tiff, other image files created with code
# - do not save images by using RStudio GUI interface
# - learn to use ggsave() command in ggplot2 for saving graphical output
# - use letters, not numbers, to name consecutive images or tables
# - figure_a, figure_b, table_a, table_b
# - these will be later converted to numbered tables and figures in your final manuscript

## 1.6 Outputs ----
# - should be used only to create and store summary .csv files that contain contents of final tables or stats numbers to be used in manuscript
# - do not use .csv files to "pass data" to other parts of project
# - first set up output as a data frame before passing to function

### 1.6.1 Store Summary Results in Table: data_table_template() ----
#
# data_table_template(data_frame=NULL,file_name=NULL)
data_table_template(data_frame=NULL,file_name="Outputs/TableA.csv")

### 1.6.2 Pad Zeroes in file names or variable names : create_padded_labels() ----
# create_padded_labels <- function(n=6,
#                                 string="Toy", 
#                                 suffix=NULL)
create_padded_labels(n=10,string="Species",suffix=".txt")

## 1.7 DataObjects ----

# Folder to hold a serialized data object
# Use to store intermediate results that may be difficult or time-consuming to repeat
# Do not use .csv files for this purpose
# Do not use save() or load() for this purpose
x <- runif(10) # an object to save
saveRDS(object=x,
        file="DataObjects/x.rds") # save to disk
restored_x <- readRDS(file="DataObjects/x.rds") # reopen to new name

y <- rnorm(3)
z <- pi
bundle <- list(x,y,z) # save multiple objects in a single list
saveRDS(object=bundle,
        file="DataObjects/bundle.rds") 
restored_bundle <- readRDS(file="DataObjects/bundle.rds")
restored_bundle$y # reference named list items
restored_bundle[[3]] # reference content of item number in a list
## 1.8 Markdown ----

# Use this folder to store .Rmd markdown scripts, local image files they may call, and markdown outputs (html, pdf files) 

# 2. Using A Logging System in R ----

## 2.1 Toggle the log console to echo log messages to screen ----
echo_log_console(TRUE) # show log messages also on screen
# echo_log_console(toggle=FALSE)


## 2.2 Basic log function l() ----
l() # plain log entry
# l(t="",index=NULL)

l('log message that is echoed to the screen')
echo_log_console(FALSE)
l('this message only shows in the log file')
l()


## 2.3 Add an 'old school' progress bar to your for loop ----
#show_progress_bar(index=i,counter=10,increment=1)
for (k in 1:100) {
  show_progress_bar(k)
  Sys.sleep(0.075)
}
l('end of loop')

### 2.3.1 Note that the progress bar also pinpoints errors ----
for (k in 1:100) {
  show_progress_bar(k)
  Sys.sleep(0.075)
  # if(k==52)print(ghost) # this throws an error!
}
l('end of loop with error')

### 2.3.2 Adjust parameters of progress bar for longer loops ----
for (k in 1:1000) {
  show_progress_bar(index=k,counter=50,dot=5)
  Sys.sleep(0.0075)
}
l('end of long loop')

### 2.3.3 Add a timer for long loops (from pracma package) ----
tic()
for (k in 1:10) {
  show_progress_bar(k)
  Sys.sleep(1)
}
toc()
l('end of timed loop')


# 3. Coding with User-Defined Functions ----

## 3.1 A template for user-defined functions: build_function() ----
# build_function <- function (function_name=NULL,
#                            file_name=NULL,
#                            file_prefix=NULL,
#                            file_suffix=NULL)
build_function("fit_regression") # creates an R script template for the function
source("Functions/FitRegression.R") # sources that script to load function in memory

## 3.2 punctuation conventions for names ----
# snake_case
# camelCase
# PascalCase
# kebab-case
# SCREAMING_SNAKE_CASE


fit_regression() # runs the new function with its default values

## 3.3  Anatomy of A User-Defined Function ----
# function name
# named input parameters
# function body
# function output (optional return() statement)

## 3.4 Features of a Good Function ----
# Has a verb-based descriptive name
# Has few inputs (< 3)
# Does one thing in isolation
# Is short (no scrolling)
# Returns one thing (could be a list)
# Uses only data from input parameters and/or locally created variables
# Does not use global variables
# Does not (usually) create or change global variables ->>
# Sets up default values, ideally based on random number generator

# 4. Functional Programming ----
# Step 1 Create Pseudocode: describe project with a list of major steps (<6)
#   Select Recipes
#   Write Shopping List
#   Buy Groceries
#   Cook Meal
#   Serve Meal
#   Clean Up

# Step 2 Each list item becomes a function
# select_recipes()
# write_shopping_list()
# cook_meal()
# serve_meal()
# clean_up()

# Step 3: Create function templates as a batch operation
build_function(c("select_recipes",
                 "write_shopping_list",
                 "buy_groceries",
                 "cook_meal",
                 "serve_meal",
                 "clean_up"))

# Step 4: Source all function templates as a batch operation
source_batch("Functions")

# Step 5: Run each function template
select_recipes()
write_shopping_list()
buy_groceries()
cook_meal()
serve_meal()
clean_up()

# Step 6: Create inputs and outputs for each function
# Step 7: Code and test functions separately
# Step 8: Link functions through shared inputs and outputs
# Step 9: In main program call functions, create outputs, pass inputs

# recipe_list <- select_recipe(cook_books,websites)
# shopping_list <- write_shopping_list(recipe_list,pantry_items)
# groceries <- buy_groceries(shopping_list)
# meal <- cook_meal(recipe_list,groceries)
# dirty_dishes <- serve_meal(meal,clean_dishes,utensils)
# clean_up(dirty_dishes,utensils)

# 5. A set of "qplot" functions for quick graphing and basic stats ----

## 5.1 Univariate plots ----

### 5.1.1 Continuous variable ----
# histogram of a numeric vector x
# one-sampled t test against null of H0 = 0 (or other specified mean)
q_hist() 
body_mass <- rgamma(n=100,shape=1,scale=10)
q_hist(body_mass)

### 5.1.2 Categorical variable ----
# bar plot of frequencies of categories ("long form" vector of labels)
# one-way contingency table bootstrap to test H0 of equal counts in each category
q_con1() # bar graph 
species_occurrence <- c(rep("species_a",30),
                         rep("species_b",34),
                         rep("species_c",5))
q_con1(x=species_occurrence)

## 5.2 Bivariate plots ----

### 5.2.1 scatter plot of numeric y versus numeric x ----
# linear and quadratic regression models with parameters, r2, significance
q_scat() # scatter plot, linear & quadratic fits

time <- 1:50
temperature <- 15 + 0.1*time - 0.005*time^2 + rnorm(50)
q_scat(x=time,y=temperature)

### 5.2.2 scatter plot of categorical y (0,1) versus numeric x ----
# logistic regression model with parameters, significance
q_logis() # scatter plot, logistic model fit

occurrence <- sample(c(rep(1,20),rep(0,7)))
time <- 1:27
q_logis(y=occurrence, x=time)

### 5.2.3 box plot of continuous y versus categorical x ----
# one-way analysis of variance with F ratio and significance
q_box() # box plot, data shown, one-way ANOVA model

city_mileage <- mpg$cty # from ggplot data frame
cylinders <- factor(mpg$cyl)
q_box(x=cylinders,y=city_mileage)

### 5.2.4 mosaic plot of categorical y ("Yes","No") versus categorical x ----
# two-way contingency table bootstrap to test H0 of no interaction (proportions of outcomes do not differ among the different categories)
q_con2()

cylinders <- factor(mpg$cyl)
drive <- factor(mpg$drv)
q_con2(x=cylinders,y=drive) # mosaic plot, two-way contingency table bootstrap test

### 5.2.5 bubble plot of continuous y versus continuous x with z variable as point size ----
# multiple regression model
# z = a + b*y + c*z

q_bub()

### 5.2.6 contour plot of coordinates with x and y as cartesian coordinates (any units)

q_contour()
