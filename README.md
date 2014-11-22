# Overall Files
* run_analysis.R - The main R script
* UCI HAR Dataset - Folder contains the data source
* output.txt - The tidy data set

# The R Script run_analysis.R
* This script is to tidy up the data with the requirements of the Project.
* The basic flow of the script is as the followings:
  1. Read the data source (Test and Train data in X_test.txt and X_train.txt) and the labels
  2. Add column names (in features.txt) to the Test and Train datasets
  3. Look up the activities (in y_test.txt and y_train.txt) and replace with the labels (in activity_labels.txt)
  4. Attach the activities (from step 3) and subjects (in subject_test.txt and subject_train.txt) to the Test and Train datasets 
  5. Merges the training and the test sets to create one data set
  6. Extract the columns in which the column name contains "mean" or "std"
  7. Calculate the mean value of the columns in step 6 with grouping the data by Activity and Subject
  8. Write the final dataset into "output.txt"