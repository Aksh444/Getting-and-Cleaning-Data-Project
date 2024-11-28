# Code Book for Human Activity Recognition Using Smartphones Dataset

## Dataset Overview
The dataset contains data collected from accelerometers of the Samsung Galaxy S smartphone. This project prepares a tidy dataset summarizing the mean of specific measurements for each activity and subject.

## Variables
1. **Subject**: Identifier for the subject (1-30).
2. **Activity**: Descriptive activity name (e.g., WALKING, SITTING).
3. **TimeBodyAccelerometerMeanX**: Mean of Time Domain Body Accelerometer signal along the X axis.
4. **TimeBodyAccelerometerMeanY**: Mean of Time Domain Body Accelerometer signal along the Y axis.
5. **...** (list all other variables similarly).

## Transformations
1. Combined training and test sets.
2. Extracted mean and standard deviation measurements.
3. Replaced activity IDs with descriptive names.
4. Renamed variables for better readability.
5. Created a tidy dataset with the average of each variable for each activity and subject.
