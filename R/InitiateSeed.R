# --------------------------------------
# FUNCTION initiate_seed
# required packages: TeachingDemos
# description: create a reproducible seed
# inputs: none 
# outputs: my_seed
########################################
initiate_seed <- function(user_seed=NULL) {
# function body

if (!is.null(user_seed)) {
  my_seed <<- user_seed
  set.seed(my_seed)
} else {
  seed_lets <- paste(sample(letters,replace=TRUE), collapse="")
  my_seed <<- TeachingDemos::char2seed(sample(seed_lets),set=FALSE)
  if(runif(1)<0.5) my_seed <<- -1*my_seed
  set.seed(my_seed)
}
} # end of initiate_seed
# -------------------
# initiate_seed()
