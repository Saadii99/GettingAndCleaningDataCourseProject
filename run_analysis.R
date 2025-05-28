# run_analysis.R

# 1. Load necessary libraries
library(dplyr)

# 2. Read activity labels and features
activity_labels <- read.table("activity_labels.txt", col.names = c("activityId", "activity"))
features <- read.table("features.txt", col.names = c("featureId", "featureName"))

# 3. Extract only the mean and standard deviation features
features_wanted <- grep("mean\\(\\)|std\\(\\)", features$featureName)
features_names <- features$featureName[features_wanted]

# Clean feature names to make them more readable
features_names <- gsub("[()]", "", features_names)

# 4. Load training data
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
x_train <- read.table("train/X_train.txt")[, features_wanted]
colnames(x_train) <- features_names
y_train <- read.table("train/y_train.txt", col.names = "activityId")

# 5. Load test data
subject_test <- read.table("test/subject_test.txt", col.names = "subject")
x_test <- read.table("test/X_test.txt")[, features_wanted]
colnames(x_test) <- features_names
y_test <- read.table("test/y_test.txt", col.names = "activityId")

# 6. Merge training and test datasets
subject_all <- rbind(subject_train, subject_test)
x_all <- rbind(x_train, x_test)
y_all <- rbind(y_train, y_test)

# 7. Combine all into one dataset
data_all <- cbind(subject_all, y_all, x_all)

# 8. Use descriptive activity names
data_all <- merge(data_all, activity_labels, by = "activityId", all.x = TRUE)
data_all <- select(data_all, -activityId)  # remove the activityId column

# 9. Create tidy dataset with the average of each variable for each activity and each subject
tidy_data <- data_all %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# 10. Write tidy data to a file
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)

# End of script
