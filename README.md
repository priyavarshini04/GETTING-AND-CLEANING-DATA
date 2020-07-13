# Getting and Cleaning Data - Peer Graded Assignment

This is the Peer Graded Assignment for the Johns Hopkins University Getting and Cleaning Data 
course offered via Coursera.
For this assignment I used RStudio with R version 3.3.1 (2016-06-21).
The submission for this assignment contains an R script which produces two independently tidy 
datasets, a codebook describing all relevnet info, and this readme file.

## Getting and Cleaning Data - Peer Graded Assignment
###What the code in 'run_analysis.R' will do (in order) when the script is run:

- Download UCI HAR Dataset and store file locally

- Load dplyr and tidyr

- Unzip locally stored zip file

- Load activity labels

- Load and select features that include mean or standard deviation
   Create list of feature names
   Transpose this list of feature names
   Make appropriate labels for the data set with descriptive variable names
   Coerce the proper dimensionality of the feature list

- Load training data
   Extract only the measurements on the mean and standard deviation for each measurement
   Appropriately label the data set with descriptive variable names

- Load testing data  
   Extract only the measurements on the mean and standard deviation for each measurement
   Appropriately label the data set with descriptive variable names

- Merge the training and the test sets to create one tidy data set: mydata
   Use descriptive activity names to name the activities in the data set

- Create a second, independent tidy data set with the average of each variable for each activity and each subject: mydata2

- Take averages for each activity

- Take averages for each subject

- Merge the two sets of averages
   Make Feature a labelled column rather than row names in accordance with tidy data theory

- View the first tidy data set: mydata

- View the second tidy data set: mydata2
  
###Some additional notes about the code in 'run_analysis.R'

The end result can be seen by running the code in RStudio and looking at the datasets
mydata and mydata2 because I have included the command to "View()" both of these datasets in 
my code, so the data sets will automatically pop up upon running the full script in RStudio.

If you already have the UCI HAR Dataset on your machine then skip the part of the script 
which downloads these data and start at line 6 with the loading of the dplyr and tidyr libraries.
