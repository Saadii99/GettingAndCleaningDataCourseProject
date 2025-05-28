# Getting and Cleaning Data - Course Project

## Overview

This project is part of the "Getting and Cleaning Data" course on Coursera. The objective is to clean and prepare data collected from the accelerometers of Samsung Galaxy S smartphones to create a tidy dataset that can be used for later analysis.

## Files

- `run_analysis.R`: R script that performs all the data processing.
- `tidy_data.txt`: Final tidy dataset containing the average of each variable for each activity and each subject.
- `CodeBook.md`: Describes the variables, data cleaning, and transformations.
- `README.md`: Explains the analysis and how everything is connected.

## How to Run

1. Download and unzip the data from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Set your R working directory to the unzipped folder.
3. Run the script:

```r
source("run_analysis.R")
