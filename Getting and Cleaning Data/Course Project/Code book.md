Code Book for Getting and Clearing Data Course Project
======================================================
#1. Data Source : Public data collected from the accelerometers from the Samsung Galaxy S smartphone.
(1) Source Site : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
(2) Source File : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
 

#2. Description about "run_analysis.R" code
(1) Merge training and test sets
 - Read the train and test data and save into seperate variables.
 - Binding train and test data 
 
(2) Extract mean and standard deviation for each measurement
 - Read the features data
 - Indexing features that contains the "mean" or "std"
 - Create new data frame which contains only the mean and standard deviation 
 - Naming the columns for new data frame with the feature names.
 
(3) Name the activities
 - Read the activity data
 - Labeling the activity data
 
(4) Labeling the dataset with descriptive variable names
 - Label the subject name and activity name as "Subject" and "Activity"
 - Create tidy data with binding subject, label and mean std dataset. 
 - Saving tidy data into text file.
 
(5) Calculate the average of each variable for each activity and each subject
 - Number of subject : 30, number of activity : 6, total combinations : 180
 - Calculate the mean of each combinations using for loops and create a dataframe which contains the results.
 - Saving second tidy data into another text file.