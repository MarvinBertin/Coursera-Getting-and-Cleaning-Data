#Code Book

##Data Source

The data source is data from "Human Activity Recognition Using Smartphones". It is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. Full description of the data can be found [here][1]

The data includes the following files:

 - 'README.txt'

 - Train
  - X_train.txt

  - Y_train.txt

 - Test

  - X_test.txt

  - y_test.txt

 - features_info.txt.

 - features.txt

 - activity_labels.txt

##Variables

30 people (*SubjectsID*) performed each 6 different activities (*Activity*: *WALKING, WALKING-UPSTAIRS, WALKING-DOWNSTAIRS, SITTING, STANDING, LAYING*).

The features on the mean, *mean()*, and standard deviation, *std()*, for each measurement are extracted to only keep *66* features out of 561. 


##Data Transformations

The following transformations are performed to the dataset by running `run_analysis.R`.

 - Requires R library: reshape2
 - Loads train and test text files into dataframes
 - Loads activity labels and features text files into data frames
 - Merges train and test data frames
 - Assigns column names to features
 - Extracts features involving mean and standard deviation measurements
 - Makes variable names more descriptive
 - Merges activity and subject columns to main dataset
 - Creates a tidy data frame by averaging each variables for each activity and each subject
 - Exports tidy data to text file

[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones