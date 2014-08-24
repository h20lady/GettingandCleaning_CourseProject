## Readme.md

CONTENTS
========


R script called "run_analysis.R" that does the following:

Merges training and the test data sets to create one data set.
-------------------------------------------------------------
Extracts only the measurements on the mean and standard deviation for each measurement. 
--------------------------------------------------------------------------------
Uses descriptive activity names to name the activities in the data set
----------------------------------------------------------------------
Appropriately labels the data set with descriptive activity names
-----------------------------------------------------------------
Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
--------------------------------------------------------------------------------


METHODOLOGY
===========


The features.txt file contains 2 variables and 561 column header names.
The column header names were made into tidy data removing paranthesis, commas and hyphens and replaced universally with an underscore.

colhdr <- read.table("./features.txt")
colhdr1 <- gsub("\\(|\\)|,|-","_",(colhdr[,2]))

The activity_labels.txt contains 2 variables and 6 rows. These activity names were used to label the "Activity" column in the final table "combfin" as decribed below:

Test files have 2947 observations. Subject_test has 1 variable, X_test has 561 variables and y_test has 1 variable.

stest <- read.table("./test/subject_test.txt")
ytest <- read.table("./test/y_test.txt")
xtest <- read.table("./test/X_test.txt")

Similiarly train files have 7352 observations. Subject_train has 1 variable, X_train has 561 variables and y_train has 1 variable.

strain <- read.table("./train/subject_train.txt")
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")

First, the test and train data tables were combined using the rbind method as below:

scomb <- rbind(stest, strain)
ycomb <- rbind(ytest, ytrain)
xcomb <- rbind(xtest, xtrain)

Next, new column headers were assigned to the tables above.
The cleaned features.txt table "colhdr1" was assigned to the xcomb table with 561 variables.

names(xcomb)= colhdr1
names(scomb)= "Subject"
names(ycomb)= "Activity"

However, only columns with mean and std were extracted for xcomb table.

index_xcomb <- grep("mean|std", names(xcomb), ignore.case =TRUE)

xcomb <-xcomb[,index_xcomb]


All three tables above were combined via cbind method to produce the final table for analysis called "combfin".
This table has 10299 rows 563 columns

combfin <- cbind(scomb,ycomb,xcomb)

Finally, the activity labels were attached to the "Activity" column or column#2 in the "combfin" table via the gsub method below:

a1 <-gsub("1",actnames[1,2],(combfin[,2]))
a2 <-gsub("2",actnames[2,2],(a1))
a3 <-gsub("3",actnames[3,2],(a2))
a4 <-gsub("4",actnames[4,2],(a3))
a5 <-gsub("5",actnames[5,2],(a4))
a6 <-gsub("6",actnames[6,2],(a5))

combfin[,2] <- a6




-

