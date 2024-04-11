
---

# CodeBook

## Overview

This codebook describes the variables, the data, and any transformations or work performed to clean up the data for the Human Activity Recognition Using Smartphones dataset.

The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

## Data Source

The data for this project was obtained from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Variables
features <- features.txt : 561 rows, 2 columns
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

activities <- activity_labels.txt : 6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)

subject_test <- test/subject_test.txt : 2947 rows, 1 column
contains test data of 9/30 volunteer test subjects being observed

x_test <- test/X_test.txt : 2947 rows, 561 columns
contains recorded features test data

y_test <- test/y_test.txt : 2947 rows, 1 columns
contains test data of activities’code labels

subject_train <- test/subject_train.txt : 7352 rows, 1 column
contains train data of 21/30 volunteer subjects being observed

x_train <- test/X_train.txt : 7352 rows, 561 columns
contains recorded features train data

y_train <- test/y_train.txt : 7352 rows, 1 columns
contains train data of activities’code labels

### Identifiers
- `subject`: ID of the subject who performed the activity (range 1 to 30)
- `activity`: Type of activity performed by the subject (6 activity types: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

### Measurements
The following variables represent mean and standard deviation measurements from the original dataset. Each variable name has been transformed to provide more descriptive names.

- `tBodyAcc.mean.X`
- `tBodyAcc.mean.Y`
- `tBodyAcc.mean.Z`
- `tBodyAcc.std.X`
- `tBodyAcc.std.Y`
- `tBodyAcc.std.Z`
- ...

## Transformations

1. Merged the training and test datasets to create one dataset.
2. Extracted only the measurements on the mean and standard deviation for each measurement.
3. Used descriptive activity names to name the activities in the dataset.
4. Appropriately labeled the dataset with descriptive variable names.
5. Created a second, independent tidy dataset with the average of each variable for each activity and each subject.

---

