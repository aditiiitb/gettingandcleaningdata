rm (list = ls())

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

datadir <- "getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/";
allfiles <- list.files(datadir, include.dirs = FALSE, recursive = TRUE, full.names = TRUE)
for(i in allfiles)
{
  file1 <- i
  file2 <- gsub("test", "train", i)
  mergedFile <- gsub("test", "merged", i)
  mergetwofiles(file1, file2, mergedFile)
}

# con_test <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt")
# con_train <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt")
# writecon <- file("../courseproject//getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/y_merged.txt")
# writeLines(c (readLines(con_test), readLines(con_train)), writecon)
# close(con_test)
# close(con_train)
# close(writecon)
# 
# con_test <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
# con_train <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
# writecon <- file("../courseproject//getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/X_merged.txt")
# writeLines(c (readLines(con_test), readLines(con_train)), writecon)
# close(con_test)
# close(con_train)
# close(writecon)
#
# con_test <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
# con_train <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
# writecon <- file("../courseproject//getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/Inertial Signals/body_acc_x_merged.txt")
# writeLines(c (readLines(con_test), readLines(con_train)), writecon)
# close(con_test)
# close(con_train)
# close(writecon)

# con_test <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
# con_train <- file("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
# writecon <- file("../courseproject//getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/merged/Inertial Signals/body_acc_y_merged.txt")
# writeLines(c (readLines(con_test), readLines(con_train)), writecon)
# close(con_test)
# close(con_train)
# close(writecon)


