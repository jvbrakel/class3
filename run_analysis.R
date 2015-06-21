      ## this script creates a tidy dataset based on the data from 
      ## Human Activity Recognition Using Smartphones Data Set 
      ## which can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
      ## 
      ## this script merges the training dataset and merges it with the test dataset, which is saved in 
      ## the xx which is a dataframe
      ##
      ##
      
      
      ##  This function creates a special "matrix" object that can cache its inverse
      ##  this script uses the reshape2 library , which you can install with 'install.packages("reshape2")'      
      ##  this script uses the dplyr library , which you can install with 'install.packages("dplyr")'      

      library(reshape2)
      library(dplyr)
      
      #load headers for train/test data
      columnDataName <- read.table("features.txt")
      
      #load test data
      test <- read.table("X_test.txt")
      #load train data
      train <- read.table("X_train.txt")
      #add headers to test data
      colnames(test)<-columnDataName[,2]
      #add headers to train data
      colnames(train)<-columnDataName[,2]
      
      # add subjectcolumn to train and test datasets 
      # add column headers in testcombined/traincombined
      
      testSubject <- read.table("subject_test.txt")
      trainSubject <- read.table("subject_train.txt")
      colnames(testSubject)<-c ("subject")
      colnames(trainSubject)<-c ("subject")
      
      # add activity column to train and test datasets 
      # add column headers in testcombined/traincombined
      testActivity <- read.table("y_test.txt")
      trainActivity <- read.table("y_train.txt")
      colnames(testActivity)<-c ("activity")
      colnames(trainActivity)<-c ("activity")

      # add column headers to activity in testcombined/traincombined
      testcombined<-cbind(test,testSubject,testActivity)
      traincombined<-cbind(train,trainSubject,trainActivity)
      
      # combine test and train dataset into combinedData
      combinedData<-rbind(traincombined,testcombined)
      
      # add descriptive names for activity
      activityTables <- read.table("activity_labels.txt")
      colnames(activityTables)<-c ("activity","activitydesc")
      combinedData <- merge(combinedData,activityTables,by="activity")
      columnDataName$V1 = as.numeric(as.character(columnDataName$V1))
      
      # filter dataset on columns which contain mean, standard deviation and activity 
      # create tidyData, which contains a skinny dataset grouping subject, activity and variable
      # which is summarized in a list by subject, activity and mean of the variables
      
      relevantData<- combinedData[,grepl('mean|std|activitydesc|subject', colnames(combinedData))]
      tidyLongData <- melt(relevantData,id=subset(colnames(relevantData),grepl('activitydesc|subject', colnames(relevantData))),measures.vars=subset(colnames(relevantData),grepl('mean|std', colnames(relevantData))))
      tidySumarizedData<-summarize(group_by(tidyLongData,activitydesc,subject,variable), average = mean(value,na.rm=TRUE))
      
      
