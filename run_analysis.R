##run_analysis.R

##1 Merge the training and the test sets to create one data set.

##Download files
 
if(!file.exists("UCI HAR data")){
  dir.create("UCI HAR data")
}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfile <- download.file(fileUrl,destfile="./UCI HAR data/files.zip",method="curl")

unzip("./UCI HAR data/files.zip",exdir="./UCI HAR data") 

##Read in training and test files

TrainFeatures <- read.table("./UCI HAR data/UCI HAR Dataset/train/X_train.txt",header=FALSE)
TestFeatures <- read.table("./UCI HAR data/UCI HAR Dataset/test/X_test.txt",header=FALSE)

TrainSubject <- read.table("./UCI HAR data/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
TestSubject <- read.table("./UCI HAR data/UCI HAR Dataset/test/subject_test.txt",header=FALSE)

TrainActivity <- read.table("./UCI HAR data/UCI HAR Dataset/train/y_train.txt",header=FALSE)
TestActivity <- read.table("./UCI HAR data/UCI HAR Dataset/test/y_test.txt",header=FALSE)

##Merge files into one data frame

train <- cbind(TrainFeatures,TrainSubject,TrainActivity)
test <- cbind(TestFeatures,TestSubject,TestActivity)
fulldata <- rbind(train,test) 

##Rename columns

features <- read.table("./UCI HAR data/UCI HAR Dataset/features.txt")
vars <- as.character(features$V2)
names(fulldata) <- c(vars,"subject","activity")
                       
##2 Extract only the measurements on the mean and standard deviation for each measurement.

mean_std <- grep(".*mean.*|.*std.*",names(fulldata))
subset_data1 <- fulldata[,mean_std] ##subset mean/std variables
subset_data2 <- fulldata[,562:563] ##subset activity and subject variables
subset_data <- cbind(subset_data1,subset_data2) 

##3 Use descriptive activity names to name the activities in the data set

activity_labels <- read.table("./UCI HAR data/UCI HAR Dataset/activity_labels.txt") ##read in activity labels
merged_data <- merge(subset_data,activity_labels,by.x="activity",by.y="V1",all.x=TRUE) ##merge labels with data set
names(merged_data) <- sub("V2","activity_label",names(merged_data)) ##rename labels column
merged_data <- merged_data[,-(1)] ##remove column with activity numbers

##4 Appropriately label the data set with descriptive variable names.

names(merged_data) <- gsub("^t","time",names(merged_data))
names(merged_data) <- gsub("^f","frequency",names(merged_data))
names(merged_data) <- gsub("Gyro","AngularVelocity",names(merged_data))
names(merged_data) <- gsub("Acc","Acceleration",names(merged_data))
names(merged_data) <- gsub("Mag","Magnitude",names(merged_data))
names(merged_data) <- gsub("BodyBody","Body",names(merged_data))
names(merged_data) <- gsub("Freq","Frequency",names(merged_data))
names(merged_data) <- gsub("std","StandardDeviation",names(merged_data))

##5 Create a second, independent tidy data set with the average of each variable for each activity and each subject.

##load reshape package

library(reshape)

datamelt <- melt(merged_data,id.vars=c("activity_label","subject"))
tidydata <- dcast(datamelt, activity_label + subject ~ variable, mean)

##write tidydata to new file

write.table(tidydata,file="tidydata.txt",row.name=FALSE) 

