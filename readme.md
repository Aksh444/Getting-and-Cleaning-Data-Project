# Getting and Cleaning Data - Course Project

This repository contains the files for the Getting and Cleaning Data course project. The purpose of this project is to demonstrate the ability to collect, work with, and clean a dataset to prepare tidy data for analysis.

## Project Overview

The data used in this project is collected from the accelerometers of the Samsung Galaxy S smartphone. The dataset contains measurements of various physical activities performed by 30 volunteers.

The goal is to create a tidy dataset that summarizes the mean of specific measurements for each activity and each subject.

## Repository Contents

This repository contains the following files:

1. **`run_analysis.R`**  
   The R script that performs the following tasks:
   - Merges the training and test datasets.
   - Extracts only the measurements on the mean and standard deviation for each measurement.
   - Uses descriptive activity names to name the activities in the dataset.
   - Appropriately labels the dataset with descriptive variable names.
   - Creates a second tidy dataset with the average of each variable for each activity and each subject.

2. **`tidy_data.txt`**  
   The final tidy dataset created in Step 5 of the project.

3. **`CodeBook.md`**  
   A codebook that describes the variables, data, and transformations performed to clean the dataset.

4. **`README.md`**  
   This file, which provides an overview of the project and instructions on how to run the analysis.

## How to Run the Analysis

To reproduce the analysis, follow these steps:

1. Clone this repository to your local machine:
   ```bash
   git clone https://github.com/your-username/Getting-and-Cleaning-Data-Project.git
