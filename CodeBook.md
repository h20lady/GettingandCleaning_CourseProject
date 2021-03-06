## Code Book.md


Raw Data
--------

The raw data set contains data tables with 3-axial motion values (X, Y, Z) of 30 volunteers performing six activities wearing a smartphone.

The raw data set includes:


- 'features.txt': List of all 3-axial motion variable names.

- 'activity_labels.txt': Links the class labels in the train and test data sets with corresponding activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.




The tables above were merged in R with the run_Analysis.R script.

The script creates a tidy data set.



Tidy Data
---------

The final tidy data table contains columns of Subject, Activity, and 86 other columns of variables of mean and standard deviation values for each measured variable.

- Column 1: Subject ID

The code for a volunteer

- Column 2: Activity

The activity performed by the volunteer:
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

- Column 3 to 88: mean values of mean/stand deviation values of observed motion variables