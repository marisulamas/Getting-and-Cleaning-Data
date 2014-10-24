Code Book
-----------------------------------------
### 1. Description of the original dataset


An experiment has been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, it captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### 2. Transformations made to the original data set.

For each type of data (train and test) a dataframe was created using the 561-feature vector dataset, the activity label and the identifier of the subject who carried out the experiment. 

- The test data set (called **test.data**) consisted of 2947 rows and 563 columns. Column names were added using the *features.txt* file provided in the original data zip file.    

- The train data set (called **train.data**) consisted of 7352 rows and 563 columns. Column names were added using the *features.txt* file provided in the original data zip file.  

- The data set **data** was created rowbinding the test.data and train.data. This dataframe has 10299 rows and 563 columns. 

- **Extracting mean() and std() variables:**  The next step consisted in extracting all the variables that had mean() and std() on their names. After that, it was necessary to eliminate all the columns that had meanFreq() on its names. The resulting dataframe was called **data3** and has 10299 rows and 68 columns. 

- **Use descriptive activity names to name the activities in the data set:** In this step the key numbers (1:6) in the activity column were replaced with its corresponding labels (WALKING,WALKING DOWNSTAIRS,...)

- **Tidy data:** Finally, the reshape2 package was used to create the **tidy.data** dataframe, with the average of each measurement variable for each activity and each subject. This dataframe has 180 rows and 68 columns. 
  - Each variable in a column
  - Each record in a row. 
  - Each variable has a human readable name.
  
### 3. Variables:

Variable name             | Variable name
-----------------------------| --------------------------------
"activity"                   |     "subject.id"            
"tBodyAcc-mean()-X"          |         "tBodyAcc-mean()-Y"          
"tBodyAcc-mean()-Z"          |      "tGravityAcc-mean()-X"       
"tGravityAcc-mean()-Y"       |       "tGravityAcc-mean()-Z"       
"tBodyAccJerk-mean()-X"      |       "tBodyAccJerk-mean()-Y"      
"tBodyAccJerk-mean()-Z"      |       "tBodyGyro-mean()-X"         
"tBodyGyro-mean()-Y"         |       "tBodyGyro-mean()-Z"         
"tBodyGyroJerk-mean()-X"     |     "tBodyGyroJerk-mean()-Y"     
"tBodyGyroJerk-mean()-Z"     |       "tBodyAccMag-mean()"         
"tGravityAccMag-mean()"      |       "tBodyAccJerkMag-mean()"     
"tBodyGyroMag-mean()"        |       "tBodyGyroJerkMag-mean()"    
"fBodyAcc-mean()-X"          |       "fBodyAcc-mean()-Y"          
"fBodyAcc-mean()-Z"          |       "fBodyAccJerk-mean()-X"      
"fBodyAccJerk-mean()-Y"      |       "fBodyAccJerk-mean()-Z"      
"fBodyGyro-mean()-X"         |       "fBodyGyro-mean()-Y"         
"fBodyGyro-mean()-Z"         |       "fBodyAccMag-mean()"         
"fBodyBodyAccJerkMag-mean()" |   "fBodyBodyGyroMag-mean()"    
"fBodyBodyGyroJerkMag-mean()"|  "tBodyAcc-std()-X"           
"tBodyAcc-std()-Y"           |  "tBodyAcc-std()-Z"           
"tGravityAcc-std()-X"        |   "tGravityAcc-std()-Y"        
"tGravityAcc-std()-Z"        |   "tBodyAccJerk-std()-X"       
"tBodyAccJerk-std()-Y"       |   "tBodyAccJerk-std()-Z"       
"tBodyGyro-std()-X"          |   "tBodyGyro-std()-Y"          
"tBodyGyro-std()-Z"          |   "tBodyGyroJerk-std()-X"      
"tBodyGyroJerk-std()-Y"      |   "tBodyGyroJerk-std()-Z"      
"tBodyAccMag-std()"          |   "tGravityAccMag-std()"       
"tBodyAccJerkMag-std()"      |   "tBodyGyroMag-std()"         
"tBodyGyroJerkMag-std()"     |   "fBodyAcc-std()-X"           
"fBodyAcc-std()-Y"           |   "fBodyAcc-std()-Z"           
"fBodyAccJerk-std()-X"       |   "fBodyAccJerk-std()-Y"       
"fBodyAccJerk-std()-Z"       |   "fBodyGyro-std()-X"          
"fBodyGyro-std()-Y"          |   "fBodyGyro-std()-Z"          
"fBodyAccMag-std()"          |   "fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-std()"     |   "fBodyBodyGyroJerkMag-std()" 





