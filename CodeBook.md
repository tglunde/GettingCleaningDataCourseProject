CodeBook
========================================================

Naming Standards
========================================================
Naming standards for columns are: capital letters only, separator '_' and no other non-letter characters

Function call for analysis
========================================================
Please source the contained file run_analysis.R
Then call run("basedir") where basedir is the directory the original data set files have been extracted into. In that same directory the resulting CSV will be written.

Original Data Set
========================================================
* main directory contains activity and feature lables
* train and test directory each contains a subject, x (feature value) and Y (activity id) file
* please see the detailed descriptions in from the original data set for the feature and activity descriptions 

For each record it is provided
======================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Transformations in run_analysis.R 
=================================
* 1. read activity and feature lables
* 2. read and combine train and test data into X,Y and S (values, activities and subjects)
* 3. selecting only the feature columns from X that contain mean or std in its lable
* 4. clean up names according to our naming standards
* 5. merging in activity lables according to the ids
* 6. combining the three data sets using cbind
* 7. Using reshape to re-order (melt) the data and then calculate the mean for all features per subject and activity
* 8. Writing the result to file in <basedir> and returning the tidy result

Columns of Result: 
==================
* 1. SUBJECT id of subject that did the test as factor variable
* 2. Activity provided as factor variable
* 3.-68. means of features provided as mean and std feature as described in the original data set

Resulting result.csv: 
=====================
The resulting data set is being written into the provided base directory as result.csv - consequently it has header names and uses sep="," which need to be taken into account as parameters when using read.table function.

