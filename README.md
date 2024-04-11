# Peer-Graded-Assignment-Getting-and-Cleaning-Data-Course-Project
Sure, here's a template for a README.md file:

---

# Human Activity Recognition Using Smartphones Dataset Analysis

## Overview

This project demonstrates the ability to collect, work with, and clean a dataset for human activity recognition using smartphones. The goal is to prepare tidy data that can be used for later analysis.

## Dataset

The dataset used for this project was obtained from the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). It consists of accelerometer and gyroscope measurements collected from the Samsung Galaxy S smartphone during various activities.

## Files

- `run_analysis.R`: R script for merging, cleaning, and summarizing the dataset.
- `CodeBook.md`: Codebook describing the variables, data, and transformations performed.
- `FinalData.txt`: Tidy dataset containing the average of each variable for each activity and each subject.

## How to Run the Analysis

To run the analysis, follow these steps:
1. Download the dataset from the provided link.
2. Place the dataset files in the appropriate directory (`UCI HAR Dataset`) in the project folder.
3. Open and run the `run_analysis.R` script in R or RStudio.

## Output

The `run_analysis.R` script performs the following tasks:
1. Merges the training and test sets to create one dataset.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the dataset.
4. Appropriately labels the dataset with descriptive variable names.
5. Creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

The output of the analysis is stored in the `FinalData.txt` file.

## Author

Ayoub Ghouzali

## License

This project is licensed under the [MIT License](https://opensource.org/licenses/MIT).

---

