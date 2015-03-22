# Course Project: Getting and Cleaning Data

resource: [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The goal of the course project is to make the data from the reference site be a tidy data for further manupulation and/or study.

## run_analysis.R

This script file downloads a zip file from the follow URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

and extracts the data files into 'data' directory in current working directory. Each data file is in text format.

It merges 2 sets of data, which are test and train data. Also it joins 3 different data files: feature, activity, and subject files. As the result, there is only one data.

It calculates the average of the feature for each subject and activity.

Also it renames a little bit cryptic column names into more cleaner ones.

Because there are values instead of variables on headers of the data, it reconstruct some columns into mean and std columns.

Finally, It write the result data back to a text file, which is 'tidy_data.txt'

## code_book.md

It contains description and information of each column in 'tidy_data.txt' file.
