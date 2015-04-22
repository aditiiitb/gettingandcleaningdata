

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



# Merging the data together
datadir <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/";
allfiles <- list.files(datadir, include.dirs = FALSE, recursive = TRUE, full.names = TRUE)
for(i in allfiles)
{
  file1 <- i
  file2 <- gsub("test", "train", i)
  mergedFile <- gsub("test", "merged", i)
  mergetwofiles(file1, file2, mergedFile)
}

# Find the set of mean and std features
featuresFile <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt";
reqFeatures <- read.table(featuresfile, stringsAsFactors = FALSE);
reqFeatures <- grep("mean()|std()", reqFeatures[,2], ignore.case = TRUE)

# Read in the merged data set 
dataFileLoc <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/X_merged.txt"
X_merged <- read.table(dataFileLoc, stringsAsFactors = FALSE, nrows = 10299, 
                       colClasses = classes , comment.char = "")
X_merged <- X_merged[,reqFeatures]

