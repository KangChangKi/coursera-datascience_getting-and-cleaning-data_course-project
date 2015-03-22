# code book

reference: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## activity (integer): activity ID

values:    
1:6

## activityName (characters): activity name

values:    
- "WALKING"
- "WALKING_UPSTAIRS"
- "WALKING_DOWNSTAIRS"
- "SITTING"
- "STANDING"
- "LAYING"

## subject (integer): subject ID

values:    
1:30

## kind (character): kind of activity

format:    
- 'frequency'/'time': time or frequency domain variables
- 'Acc': acceleration
- 'Gyro': gyroscope
- 'Mag': magnitude

values:    
- "frequencyBodyAcc_X"
- "frequencyBodyAcc_Y"
- "frequencyBodyAcc_Z"
- "frequencyBodyAccJerk_X"
- "frequencyBodyAccJerk_Y"
- "frequencyBodyAccJerk_Z"
- "frequencyBodyAccJerkMag"
- "frequencyBodyAccMag"
- "frequencyBodyGyro_X"
- "frequencyBodyGyro_Y"
- "frequencyBodyGyro_Z"
- "frequencyBodyGyroJerkMag"
- "frequencyBodyGyroMag"
- "timeBodyAcc_X"
- "timeBodyAcc_Y"
- "timeBodyAcc_Z"
- "timeBodyAccJerk_X"
- "timeBodyAccJerk_Y"
- "timeBodyAccJerk_Z"
- "timeBodyAccJerkMag"
- "timeBodyAccMag"
- "timeBodyGyro_X"
- "timeBodyGyro_Y"
- "timeBodyGyro_Z"
- "timeBodyGyroJerk_X"
- "timeBodyGyroJerk_Y"
- "timeBodyGyroJerk_Z"
- "timeBodyGyroJerkMag"
- "timeBodyGyroMag"
- "timeGravityAcc_X"
- "timeGravityAcc_Y"
- "timeGravityAcc_Z"
- "timeGravityAccMag"

## mean (float): mean of the kind of activity

values:    
-1:1

## std (float): standard deviation of the kind of activity

values:    
-1:1
