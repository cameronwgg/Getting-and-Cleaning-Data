#**Getting and Cleaning Data Course Project**

The script run_analysis.R creates a tidy data set from the Human Activity Recognition Using Smartphones Dataset. The tidy data includes the average of each variable that includes mean or standard deviation measurements for each activity and each subject.

The script first downloads the zip file using download.file, then unzips it and reads the files into R using read.table. After merging the "train" and "test" data frames, extracting mean and standard deviation measurements, adding descriptive activity names, and renaming variables, the script uses the reshape package to generate the average of each variable for each activity and subject. The result is a tidy data set, "tidydata.txt", that meets the principles of tidy data (one variable per column, and each observation in a row).

See the CodeBook.md file for more detail on data transformations and variable descriptions.

The tidy data can be read into R using read.table.

The original data set is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). 
