

files used :

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

Variables utilized and processes applied
- test, contains x_text.txt
- train, contains x_train.txt
- columnDataName, contains features.txt
- testSubject, contains subject_test.txt
- trainSubject, contains subject_train.txt
- testActivity, contains y_test.txt
- trainActivity, contains y_train.txt
- activityTables, contains activity_labels.txt
- testcombined, contains the combination of test,testSubject,testActivity
- traincombined, contains the combination of train,trainSubject,trainActivity
- combinedData, contains the combination of testcombined and traincombined and merged in activitytables
- relevantData, filters combinedData on Mean, standard deviation, subject and activity columns
- tidyLongData, melts revelantdata, ID's are subject and Activity. values are Mean, standard deviation columns
- tidySumarizedData, summarizes tidyLongData by grouping on activity, subject and measurement, calculating a mean of the value



 
