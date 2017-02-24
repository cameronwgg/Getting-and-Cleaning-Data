#**Code Book**

This Code Book describes the data transformations in run_analysis.R and the variables in tidydata.txt.

##**Data Transformations**

The run_analysis.R script creates a tidy version of the UCI Human Activity Recognition Using smartphones Dataset. The script executes the following steps.

1 The training and test data sets are merged. 

    * "X_train.txt", "subject_train.txt", and "y_train.txt" are combined using cbind to create the training data set.
    * "X_test.txt", "subject_test.txt", and "y_test.txt" are combined using cbind to create the test data set.
    * The training and test data sets are combined using rbind.
    * "features.txt", "activity", and "subject" are assigned as column names.

2 The measurements on mean and standard deviation are extracted.

    * The grep function is used to identify and subset only variable names that include "mean" and "std".

3 Descriptive activity names are added.

    * The "activity_labels.txt"" file is merged with the extracted data using the merge function, adding a column with descriptive activity names.

4 The variables are labeled with descriptive names.

    * The gsub function generates more descriptive names for the variables (e.g. "Acceleration" is substituted for "Acc", "time" for "t",etc.)

5 A tidy data set is generated with the average of each variable for each activity and subject, using the reshape package.

    * The melt function is used to create a narrow data frame, with "activity_labels" and "subject" as id variables.
    * The dcast function takes the melted data frame and finds the mean value of each measurement for each activity and subject.
    * The write.table function generates a new tidy data frame, "tidydata.txt".

##**Variables**

* activity_label: Descriptive name for the activity performed by the subject. Factor levels are:

    * WALKING

    * WALKING_UPSTAIRS

    * WALKING_DOWNSTAIRS

    * SITTING

    * STANDING

    * LAYING
	
* subject: Number identifying the subject that performed the activity. Its range is 1-30.

*The remaining variables in the tidy data represent the average values of variables measuring mean or standard
deviation for each activity and each subject. '-XYZ' is used to denote 3-axial signals in the X, Y and 
Z directions.*

*Time domain signals on acceleration (from the accelerometer), divided into body and gravity acceleration signals. Acceleration is measured in 'g's (gravity of earth -> 9.80665 m/seg2):*

* timeBodyAcceleration.mean()-X                          
* timeBodyAcceleration.mean()-Y                          
* timeBodyAcceleration.mean()-Z                          
* timeBodyAcceleration.StandardDeviation()-X             
* timeBodyAcceleration.StandardDeviation()-Y
* timeBodyAcceleration.StandardDeviation()-Z             
* timeGravityAcceleration.mean()-X                     
* timeGravityAcceleration.mean()-Y                      
* timeGravityAcceleration.mean()-Z                       
* timeGravityAcceleration.StandardDeviation()-X         
* timeGravityAcceleration.StandardDeviation()-Y         
* timeGravityAcceleration.StandardDeviation()-Z       

*Time domain signals on angular velocity (from the gyroscope). Gyroscope units are in rad/seg:*

* timeBodyAngularVelocity.mean()-X                      
* timeBodyAngularVelocity.mean()-Y                       
* timeBodyAngularVelocity.mean()-Z                       
* timeBodyAngularVelocity.StandardDeviation()-X          
* timeBodyAngularVelocity.StandardDeviation()-Y          
* timeBodyAngularVelocity.StandardDeviation...Z"       

*Body linear acceleration and angular velocity derived in time to obtain Jerk signals:*

* timeBodyAccelerationJerk.mean()-X                      
* timeBodyAccelerationJerk.mean()-Y                       
* timeBodyAccelerationJerk.mean()-Z                      
* timeBodyAccelerationJerk.StandardDeviation()-X      
* timeBodyAccelerationJerk.StandardDeviation()-Y         
* timeBodyAccelerationJerk.StandardDeviation()-Z            
* timeBodyAngularVelocityJerk.mean()-X                   
* timeBodyAngularVelocityJerk.mean()-Y                    
* timeBodyAngularVelocityJerk.mean()-Z                   
* timeBodyAngularVelocityJerk.StandardDeviation()-X      
* timeBodyAngularVelocityJerk.StandardDeviation()-Y      
* timeBodyAngularVelocityJerk.StandardDeviation()-Z       

*Magnitude of Jerk signals calculated using Euclidian norm:*
                  
* timeBodyAccelerationMagnitude.mean()                   
* timeBodyAccelerationMagnitude.StandardDeviation()      
* timeGravityAccelerationMagnitude.mean()        
* timeGravityAccelerationMagnitude.StandardDeviation()   
* timeBodyAccelerationJerkMagnitude.mean()               
* timeBodyAccelerationJerkMagnitude.StandardDeviation()  
* timeBodyAngularVelocityMagnitude.mean()                
* timeBodyAngularVelocityMagnitude.StandardDeviation()   
* timeBodyAngularVelocityJerkMagnitude.mean()            
* timeBodyAngularVelocityJerkMagnitude.StandardDeviation()

*Fast Fourier Transform (FFT) applied to some of these signals (frequency domain signals):* 

* frequencyBodyAcceleration.mean()-X                  
* frequencyBodyAcceleration.mean()-Y                      
* frequencyBodyAcceleration.mean()-Z                     
* frequencyBodyAcceleration.StandardDeviation()-X        
* frequencyBodyAcceleration.StandardDeviation()-Y        
* frequencyBodyAcceleration.StandardDeviation()-Z        
* frequencyBodyAcceleration.meanFrequency()-X            
* frequencyBodyAcceleration.meanFrequency()-Y            
* frequencyBodyAcceleration.meanFrequency()-Z            
* frequencyBodyAccelerationJerk.mean()-X                 
* frequencyBodyAccelerationJerk.mean()-Y                 
* frequencyBodyAccelerationJerk.mean()-Z                 
* frequencyBodyAccelerationJerk.StandardDeviation()-X    
* frequencyBodyAccelerationJerk.StandardDeviation()-Y    
* frequencyBodyAccelerationJerk.StandardDeviation()-Z    
* frequencyBodyAccelerationJerk.meanFrequency()-X        
* frequencyBodyAccelerationJerk.meanFrequency()-Y        
* frequencyBodyAccelerationJerk.meanFrequency()-Z        
* frequencyBodyAngularVelocity.mean()-X                  
* frequencyBodyAngularVelocity.mean()-Y                  
* frequencyBodyAngularVelocity.mean()-Z                  
* frequencyBodyAngularVelocity.StandardDeviation()-X     
* frequencyBodyAngularVelocity.StandardDeviation()-Y     
* frequencyBodyAngularVelocity.StandardDeviation()-Z      
* frequencyBodyAngularVelocity.meanFrequency()-X         
* frequencyBodyAngularVelocity.meanFrequency()-Y         
* frequencyBodyAngularVelocity.meanFrequency()-Z         
* frequencyBodyAccelerationMagnitude.mean()              
* frequencyBodyAccelerationMagnitude.StandardDeviation() 
* frequencyBodyAccelerationMagnitude.meanFrequency()     
* frequencyBodyAccelerationJerkMagnitude.mean()          
* frequencyBodyAccelerationJerkMagnitude.StandardDeviation()
* frequencyBodyAccelerationJerkMagnitude.meanFrequency() 
* frequencyBodyAngularVelocityMagnitude.mean()        
* frequencyBodyAngularVelocityMagnitude.StandardDeviation() 
* frequencyBodyAngularVelocityMagnitude.meanFrequency()  
* frequencyBodyAngularVelocityJerkMagnitude.mean()        
* frequencyBodyAngularVelocityJerkMagnitude.StandardDeviation()
* frequencyBodyAngularVelocityJerkMagnitude.meanFrequency()

