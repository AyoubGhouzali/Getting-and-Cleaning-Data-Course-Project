# Creating directory if it doesn't exist
if (!file.exists("C:/Users/ayoub/Desktop/CCD_assignment")) {
  dir.create("C:/Users/ayoub/Desktop/CCD_assignment")
}

# Downloading and unzipping the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "C:/Users/ayoub/Desktop/CCD_assignment/final.zip")
unzip(zipfile = "C:/Users/ayoub/Desktop/CCD_assignment/final.zip", exdir = "C:/Users/ayoub/Desktop/CCD_assignment")

# Reading individual data files
features <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("C:/Users/ayoub/Desktop/CCD_assignment/UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merging data into a single dataset
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

# Selecting relevant columns for TidyData
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

# Renaming columns and cleaning up names
TidyData$code <- activities[TidyData$code, 2]

names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

# Grouping and summarizing the data
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

# Writing the final tidy dataset to a file
write.table(FinalData, "FinalData.txt", row.name=FALSE)
