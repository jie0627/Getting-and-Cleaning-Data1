## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

if (!require("data.table")) {
      install.packages("data.table")
}

library(data.table)

# Load and process X_test & y_test data
testData_X <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
testData_y <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
testData_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

# Load and process X_train & y_train data
trainData_X <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
trainData_y <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
trainData_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

# Load activity labels in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
testData_y$V1 <- factor(testData_y$V1,levels=activity$V1,labels=activity$V2)
trainData_y$V1 <- factor(trainData_y$V1,levels=activity$V1,labels=activity$V2)

# Load column names in the data set
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
colnames(testData_X)<-features$V2
colnames(trainData_X)<-features$V2
colnames(testData_y)<-c("Activity")
colnames(trainData_y)<-c("Activity")
colnames(testData_sub)<-c("Subject")
colnames(trainData_sub)<-c("Subject")

# merge test and training sets into one data set
testData<-cbind(testData_X,testData_y)
testData<-cbind(testData_X,testData_sub)
trainData<-cbind(trainData_X,trainData_y)
trainData<-cbind(trainData_X,trainData_sub)
Data<-rbind(testData,trainData)

# mean and standard deviation for each measurement
Data_mean<-sapply(Data,mean,na.rm=TRUE)
Data_sd<-sapply(Data,sd,na.rm=TRUE)

# Create tidy data set 
DataTable <- data.table(Data)
tidy<-DataTable[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy,file="tidy.txt",sep=",",row.names = FALSE)
