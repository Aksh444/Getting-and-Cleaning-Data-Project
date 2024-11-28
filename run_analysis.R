# Set the paths to the train and test folders
train_folder <- "C:/Users/Akshit Tiwari/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train"
test_folder <- "C:/Users/Akshit Tiwari/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test"

# Load the feature names
features <- read.table("C:/Users/Akshit Tiwari/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt")
activity_labels <- read.table("C:/Users/Akshit Tiwari/Downloads/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

# Load training data
train_data <- read.table(file.path(train_folder, "X_train.txt"))
train_labels <- read.table(file.path(train_folder, "y_train.txt"))
train_subjects <- read.table(file.path(train_folder, "subject_train.txt"))

# Load test data
test_data <- read.table(file.path(test_folder, "X_test.txt"))
test_labels <- read.table(file.path(test_folder, "y_test.txt"))
test_subjects <- read.table(file.path(test_folder, "subject_test.txt"))

# Combine train and test datasets
combined_data <- rbind(train_data, test_data)  # Feature data
combined_labels <- rbind(train_labels, test_labels)  # Activity labels
combined_subjects <- rbind(train_subjects, test_subjects)  # Subject data

# Assign column names
colnames(combined_data) <- features$V2
colnames(combined_labels) <- "Activity"
colnames(combined_subjects) <- "Subject"

# Combine all data into one dataset
final_data <- cbind(combined_subjects, combined_labels, combined_data)

# View the first few rows of the combined data
head(final_data)

# Identify columns with mean and standard deviation measurements
mean_std_columns <- grep("-(mean|std)\\(\\)", features$V2)

# Subset the combined data to keep only subject, activity, and mean/std columns
final_data_mean_std <- final_data[, c(1, 2, mean_std_columns + 2)]  # Adding 2 because first two columns are Subject and Activity

# View the structure of the subsetted data
str(final_data_mean_std)






# Map activity labels to their descriptive names
final_data_mean_std$Activity <- factor(final_data_mean_std$Activity, 
                                       levels = activity_labels$V1, 
                                       labels = activity_labels$V2)

# View the updated data
head(final_data_mean_std$Activity)





# Clean up column names for better readability
names(final_data_mean_std) <- gsub("^t", "Time", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("^f", "Frequency", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("Acc", "Accelerometer", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("Gyro", "Gyroscope", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("Mag", "Magnitude", names(final_data_mean_std))
names(final_data_mean_std) <- gsub("BodyBody", "Body", names(final_data_mean_std))

# View updated column names
colnames(final_data_mean_std)





# Load dplyr for data manipulation
library(dplyr)

# Group data by Subject and Activity, then calculate the mean for each variable
tidy_data <- final_data_mean_std %>%
  group_by(Subject, Activity) %>%
  summarize_all(mean)

# Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# View the first few rows of the tidy data
head(tidy_data)










