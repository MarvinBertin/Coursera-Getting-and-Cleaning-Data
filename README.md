#Getting and Cleaning Data - Course Project

##Description

The R script called `run_analysis.R` does the following:
 
 1. Merges the training and the test sets to create one data set. 
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set.
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Run R Script

 1. Download the dataset that is available [here][1] onto your local directory.
 2.  Open RStudio and set it as your working directory using `setwd()` function. 
 3. Save `run_analysis.R` in the same folder and run it using `source("run_analysis.R")`.
 4. A new file called `TidyData.txt` will be generated in your working directory

##Tidy Dataset

`TidyData.txt` is available in the repository. It contains the average ( for mean and standard deviation measurements) of each variable for each activity and each subject.  

## Codebook

A codebook, `CodeBook.md`, is available in the repository. It describes the variables, the data, and transformations performed to clean up the data. 


[1]:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip