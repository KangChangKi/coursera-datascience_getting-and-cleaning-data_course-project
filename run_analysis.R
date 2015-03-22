library(dplyr)
library(tidyr)

#### download data files

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("data")) {
  dir.create("data")
}
if (!file.exists("data/UCI HAR Dataset.zip")) {
  download.file(url = fileUrl, destfile = "data/UCI HAR Dataset.zip", method = "curl")
}
if (!file.exists("data/UCI HAR Dataset")) {
  unzip("data/UCI HAR Dataset.zip", exdir = "data")  
}

#### read in data files

d_features <- read.table(file = "data/UCI HAR Dataset/features.txt")
d_names <- d_features[, 2]
d_activity <- tbl_df(read.table(file = "data/UCI HAR Dataset/activity_labels.txt", stringsAsFactors = F))
names(d_activity) <- c("activity", "activityName")

s_test <- tbl_df(read.table(file = "data/UCI HAR Dataset/test/subject_test.txt"))
s_train <- tbl_df(read.table(file = "data/UCI HAR Dataset/train/subject_train.txt"))
s <- bind_rows(s_test, s_train)
names(s) <- c("subject")

d_test <- tbl_df(read.table(file = "data/UCI HAR Dataset/test/X_test.txt"))
d_train <- tbl_df(read.table(file = "data/UCI HAR Dataset/train/X_train.txt"))
d <- bind_rows(d_test, d_train)
names(d) <- d_names

f <- tbl_df(d_features)
names(f) <- c("index", "varName")
columns <- filter(f, grepl("std\\(\\)|mean\\(\\)", varName))$varName
columns <- as.character(columns)    # factor -> character
d <- d[, columns]

a_test <- tbl_df(read.table(file = "data/UCI HAR Dataset/test/y_test.txt"))
a_train <- tbl_df(read.table(file = "data/UCI HAR Dataset/train/y_train.txt"))
a <- bind_rows(a_test, a_train)
names(a) <- c("activity")

t <- bind_cols(s, a, d)    # tbls -> data.frame
t <- tbl_df(t)

#### join

t2 <- right_join(d_activity, t)

#### group by

by_as <- group_by(t2, activity, activityName, subject)
t3 <- summarise_each(by_as, funs(mean))

#### rename columns to cleaner names

uglyNames <- names(t3)
uglyNames <- sub("^(.+?)\\-(.+?\\(\\))\\-([XYZ])$", "\\1_\\3-\\2", uglyNames)
uglyNames <- sub("\\(\\)", "", uglyNames)
uglyNames <- sub("^t", "time", uglyNames)
uglyNames <- sub("^f", "frequency", uglyNames)
cleanNames <- sub("BodyBody", "Body", uglyNames)
names(t3) <- cleanNames

#### tidy data

t4 <- gather(t3, key, value, -(activity:subject))
t5 <- extract(t4, key, c("kind", "prop"), "(.+?)\\-(.+)")
t6 <- spread(t5, prop, value)

#### write it back to file

write.table(t6, "tidy_data.txt", row.names = FALSE)
