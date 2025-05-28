# Code Book

This code book describes the variables and transformations used in the tidy dataset created from the UCI HAR Dataset.

## Data Source

Original data was taken from:  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables

The tidy dataset includes the following:

- `subject`: An identifier for the subject (1 to 30)
- `activity`: The type of activity performed (e.g., WALKING, WALKING_UPSTAIRS, etc.)
- All remaining columns are the average of mean and standard deviation measurements for each feature grouped by subject and activity.

Examples of measurement columns:
- `tBodyAcc-mean()-X`
- `tBodyAcc-std()-Y`
- `fBodyGyro-meanFreq()-Z`

Each of these variables represents the average value for that variable, calculated for each subject-activity pair.

## Transformations

The following steps were performed in the script `run_analysis.R`:

1. Merged the training and test datasets.
2. Extracted measurements on the mean and standard deviation.
3. Applied descriptive activity names.
4. Cleaned and renamed variables for clarity.
5. Created a second tidy dataset with the average of each variable for each activity and subject.
