#load data from folders

direct <-setwd("C:/DataScienceR/Project/UCI HAR Dataset")

#read, clean header file features.txt

colhdr <- read.table("./features.txt")
colhdr1 <- gsub("\\(|\\)|,|-","_",(colhdr[,2]))

##read file activity_lables.txt

actnames <- read.table("./activity_labels.txt")
actlabel <- actnames[2]

#load test and train folders

stest <- read.table("./test/subject_test.txt")
ytest <- read.table("./test/y_test.txt")
xtest <- read.table("./test/X_test.txt")

strain <- read.table("./train/subject_train.txt")
xtrain <- read.table("./train/X_train.txt")
ytrain <- read.table("./train/y_train.txt")

#combine rows and assign column headers from cleaned features.txt above

scomb <- rbind(stest, strain)
ycomb <- rbind(ytest, ytrain)
xcomb <- rbind(xtest, xtrain)

names(xcomb)= colhdr1
names(scomb)= "Subject"
names(ycomb)= "Activity"

#combine columns with only mean and standard deviation

index_xcomb <- grep("mean|std", names(xcomb), ignore.case =TRUE)

xcomb <-xcomb[,index_xcomb]

combfin <- cbind(scomb,ycomb,xcomb)
dim(combfin)

# assign activity labels to "Activity" column in final table "combin"

a1 <-gsub("1",actnames[1,2],(combfin[,2]))
a2 <-gsub("2",actnames[2,2],(a1))
a3 <-gsub("3",actnames[3,2],(a2))
a4 <-gsub("4",actnames[4,2],(a3))
a5 <-gsub("5",actnames[5,2],(a4))
a6 <-gsub("6",actnames[6,2],(a5))

combfin[,2] <- a6

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

library(reshape2)

meltdata <- melt(combfin,id=c("Subject","Activity"), measure.vars = names(xcomb))
tidydata <- dcast(meltdata, Subject+Activity ~ variable,mean)

write.table(tidydata, "tidydata.txt", row.name=FALSE)

