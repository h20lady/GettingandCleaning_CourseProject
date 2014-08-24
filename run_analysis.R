#load data from folders after finding structure of files befire merging

direct <-setwd("C:/DataScienceR/Project/UCI HAR Dataset")

c(1:561) <- read.table("./features_info.txt")

#merge rows/columns as appropriate