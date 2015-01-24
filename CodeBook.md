# Following document contains:

Part 1: Description of the variables contained in the dataset
Part 2: Description of the actions performed to clean the dataset

# Part 1: Description of the variables contained in the dataset, those kept and those dropped (at the bottom of the page) for the purpose of the assignment.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Entire set of variables that were estimated from the signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

=================================================
=================================================

Set of variables that were kept for the purpose of this assignment. All variations estimated from the signals containing:

mean(): Mean value
std(): Standard deviation

# Part 2: Actions performed on the raw data to end up at a clean data set according to the course project
The numbered correspond to the actions performed in the actual .r script called "run_analysis.r".

1. Install required packages: dplyr and reshape2
2. Create paths to required files
3. Create data.frame of variable names by reading "features.txt" into R
4. Slight renaming of variable names for compatibility reasons: drop suffixes of "-()" and rename: "-mean" into "Mean" and rename: "-std" into "Std"
3. Create data set of Train data, which includes:
	a. Create data.frame of variable measurements contained in "X_train.txt"
	b. Substitute numbered column names for correct variable names from step 2+3
	c. Create data.frame of activity performed by subjects from "y_train.txt"
	d. Substitute numeric values for descriptive labels from "activity_labels.txt"
	e. Create data.frame of subjects from "subject_train.txt"
	f. Bind by column the above in new data frame
4. Create data set of Test data, which includes:
	a. Create data.frame of variable measurements contained in "X_test.txt"
	b. Substitute numbered column names for correct variable names from step 2+3
	c. Create data.frame of activity performed by subjects from "y_test.txt"
	d. Substitute numeric values for descriptive labels from "activity_labels.txt"
	e. Create data.frame of subjects from "subject_test.txt"
	f. Bind by column the above in new data frame
5. Create data set containing all data by binding by row from the results of step 3f and 4f.
6. Extract variables relevant to the course project, which includes:
	a. Loading dplyr package
	b. Removing duplicated columns
	c. Selecting relevant columns of: Subject, Activity and those containing "Mean" and "Std"
	d. Arranging data set with the relevant variables/columns by Subject and Activity
7. Create second data frame containing only the means of the variables with measurements, which includes:
	a. Loading reshape2 package
	b. Create long shaped dataset from wide shaped dataset
	c. Transform long shaped dataset back into wide shaped dataset and aggregate on subject + activity and applying mean function
8. Write both datasets to working directory: one clean dataset with all relevant data, one clean dataset with calculated means.	
