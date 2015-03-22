# coursera-datascience_getting-and-cleaning-data_course-project

## run_analysis.R

It downloads a zip file from the follow URL:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It extracts data files in the zip file into data directory and reads in the data files, which are in text format. It merges test and train data. Also it joins 3 data files: feature, activity, and subject files. As the result there is only one data.

It calculates the average of the data for each subject and activity.

Also it renames column names into more cleaner ones.

Because I think there are values instead of variables on headers of the data, it reconstruct some columns into mean and std columns.

Finally, It write the result data back to a text file, which is 'tidy_data.txt'

## code_book.md

It contains description and information of each column in 'tidy_data.txt' file.
