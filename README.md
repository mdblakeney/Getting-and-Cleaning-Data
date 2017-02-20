# Getting and Cleaning Data Course Project
Author: Mike Blakeney
Date: 2/19/2017

## Note to Graders
Use the following to load the tidy data file:
'data = read.table("measurements_means.txt",header = TRUE)'

Also, note that my R script assumes that the required data files are in your current working directory. On my machine, I simply unzipped the UCI HAR dataset archive to C:\R. The following files are required:

- features.txt
- activity_labels.txt
- test/subject_test.txt
- test/y_test.txt
- test/X_test.txt
- train/subject_train.txt
- train/y_train.txt
- train/X_train.txt

## Project Description
[From the project instructions]: "The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected."

Note that there is only one script for this project (run_analysis.R), and it assumes that the required data files are in the current working directory.

##Study design and data processing

###Collection of the raw data
Data was downloaded from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

##Creating the tidy datafile

###Cleaning the data
[From the project instructions]: ...create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script run_analysis.R performs these 5 steps in the order given, then writes the tidy data set to a txt file using write.table()

NOTE: run_analysis.R assumes that the required data files are in the current working directory. On my machine, I simply unzipped the UCI HAR dataset archive to C:\R. The following files are required:

- features.txt
- activity_labels.txt
- test/subject_test.txt
- test/y_test.txt
- test/X_test.txt
- train/subject_train.txt
- train/y_train.txt
- train/X_train.txt

##Description of the output file
My R script produces, as its output, a tidy data file ("measurements_means.txt"):
 - Contains 180 observations of 68 variables
 - Observations include 30 test subjects, observed while performing 6 different activities
 - See the Code Book.md file for a detailed summary of the variables

