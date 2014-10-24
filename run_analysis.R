###A. Downloading (and unzipping) zip file:
setwd("~/Cleaning Data/Data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./Data.zip")
unzip("Data.zip", exdir="./RawData")

################
###B. Binding the test data:subject,activity and features databases
################
###0. Opening test data:
setwd("~/Cleaning Data/Data/RawData/UCI HAR Dataset")
test.data<-read.table("X_test.txt",sep="")

###1. Adding variable names to the test data set:
variables.names<-read.table("features.txt",sep="")
variables.names<-t(variables.names[,2])
names(test.data)<-variables.names

###2. Opening and adding the subject.test column to the test.data
subject.test<-read.table("subject_test.txt",sep="")
names(subject.test)<-c("subject.id")
test.data<-cbind(subject.test,test.data)


###3. Opening and adding the y.test column to the test.data as activity:
y.test<-read.table("y_test.txt",sep="")
names(y.test)<-c("activity.id")
test.data<-cbind(y.test,test.data)
###View(test.data) ##Used to view the data in a excell-type arrangement

################
###C. Binding the train data: subject,activity and features databases
################

###0. Opening train data:

train.data<-read.table("X_train.txt",sep="")

###1. Adding variable names to the train data set:
names(train.data)<-variables.names

###2. Opening and adding the subject.train column to the train.data
subject.train<-read.table("subject_train.txt",sep="")
names(subject.train)<-c("subject.id")
train.data<-cbind(subject.train,train.data)

###3. Opening and adding the y.train column to the train.data as activity:
y.train<-read.table("y_train.txt",sep="")
names(y.train)<-c("activity.id")
train.data<-cbind(y.train,train.data)
#View(train.data)

################
###D. Merging Test and train datasets
################

data<-rbind(test.data,train.data)


################
###E. Extracting mean and std measurements
################
means<-data[,grepl("mean()",names(data))] #extracts all the columns of the data set with "mean()" in its name
stds<-data[,grepl("std()",names(data))] #extracts all the columns of the data set with "std()" in its name
data2<-cbind(data$activity.id,data$subject.id,means,stds) #final dataframe with activity, subject.id and the columns extracted previously

##Extracting meanFreq columns
a<-grepl("meanFreq()",names(data2))
datameanFreq<-data2[,a]
meanFreq<-names(datameanFreq)
data3<-data2[, !names(data2) %in% meanFreq]

################
###F. Use descriptive activity names to name the activities in the data set
################
activity<-read.table("activity_labels.txt",sep="")
names(activity)<-c("activity.id","activity")
data4<-merge(activity,data3,by.x="activity.id",by.y="data$activity.id")
data4<-data4[,-1]

################
###G. Label the data set with descriptive variable names
################

#I used as variable names the ones from the features.txt file

################
###H. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
################
library(reshape)
library(reshape2)

dataMelt <- melt(data4, id.vars=c("activity","data$subject.id"))
tidy.data<-cast(data=dataMelt,fun=mean) #Tidy.data is a dataframe with 180 rows (30*6) and 68 columns
###################
###I. Writing the tidy data set
###################
setwd("C:/Users/Marisu/Documents/Cleaning Data/Data/TidyData")
write.table(tidy.data, file="TidyData.txt",row.name=F,sep=",")
