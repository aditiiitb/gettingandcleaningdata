
rm (list = ls())

# Useful functions
# ===================
mergetwofiles <- function (file1, file2, writeFile) 
{
  con_test <- file(file1)
  con_train <- file(file2)
  writecon <- file(writeFile)
  writeLines(c (readLines(con_test), readLines(con_train)), writecon)
  close(con_test)
  close(con_train)
  close(writecon)
}

# STEP 1 - Merging the data together

datadir <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/";
allfiles <- list.files(datadir, include.dirs = FALSE, recursive = TRUE, full.names = TRUE)
for(i in allfiles)
{
  file1 <- i
  file2 <- gsub("test", "train", i)
  mergedFile <- gsub("test", "merged", i)
  #mergetwofiles(file1, file2, mergedFile)
}


rowsToRead <- 10299

# STEP 2 - Extract data set for mean and std only

# Find the set of mean and std feature column numbers
featuresFile <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt";
features <- read.table(featuresFile, stringsAsFactors = FALSE);
reqFeatures <- grep("mean()|std()", features[,2], ignore.case = TRUE)

# Read in the merged data set for above columns only
dataFileLoc <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/X_merged.txt"
X_merged <- read.table(dataFileLoc, stringsAsFactors = FALSE, nrows = 5)
classes <- sapply(X_merged, class)
X_merged <- read.table(dataFileLoc, stringsAsFactors = FALSE, nrows = rowsToRead, 
                       colClasses = classes , comment.char = "")
X_merged <- X_merged[,reqFeatures]



# STEP 3 - Set names for every activity instead of numbers

# Read in labels of activities
labelsfile <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"
labels <- read.table(labelsfile, stringsAsFactors = FALSE)

# Read in activity label for every observation
activitiesfile <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/y_merged.txt";
activitylabels <- read.table(activitiesfile, stringsAsFactors = FALSE,
                             nrows = rowsToRead, colClasses = "integer");
# convert the table into a character vector
activitylabels <- activitylabels[,1]
# Replace numbers with labels in activities
activitylabels <- labels[activitylabels,2]


# STEP 4 - Name the measurement columns
# We already have the features read in the table "features"
names(X_merged) <- features[sub("V", "", names(X_merged)),2]

# STEP 5 - Average of each variable for each activity for each subject
# One value per subject per activity per variable => 4 columns and 30*6*86 rows

# Read in subjects file
file <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/subject_merged.txt"
subjects <- read.table(file, stringsAsFactors = FALSE, nrows = rowsToRead)
# convert the table into a character vector
subjects <- subjects[,1]

# Add subjects and activity column to data
install.packages("dplyr")
library(dplyr)
X_merged <- mutate(X_merged, activity = activitylabels, subject = subjects)

# Group by subject and activity for each variable , calculate its mean
tidydata <- aggregate(x = X_merged[1:86], by = list(Subject = X_merged$subject,Activity = X_merged$activity), FUN = "mean")

# sort by activity, subject
tidydata <- arrange(tidydata, Subject, Activity)

