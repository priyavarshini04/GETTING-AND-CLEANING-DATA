##Download UCI HAR Dataset and store file locally
myfile <- "GACD_PGA.zip"
myurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(myurl, myfile)

##Load dplyr and tidyr
library(dplyr)
library(tidyr)

##Unzip locally stored zip file
myunzip <- unzip(myfile)

##Load activity labels
myALs1 <- tbl_df(read.table("UCI HAR Dataset/activity_labels.txt"))
myALs2 <- select(myALs1, V2)

##Load and select features that include mean or standard deviation
myfeats1 <- read.table("UCI HAR Dataset/features.txt")
myfeats2 <- tbl_df(myfeats1)
myfeats3 <- grep(".*mean.*|.*std.*", myfeats1[,2])

##Create list of feature names
myfeatsnames <- myfeats2[myfeats3, 2]

##Transpose this list of feature names
myfeatsnames <- t(myfeatsnames)

##Make appropriate labels for the data set with descriptive variable names
myfeatsnames = gsub("-mean", " Mean", myfeatsnames[1:79])
myfeatsnames = gsub("-std", " Standard Deviation", myfeatsnames[1:79])
myfeatsnames = gsub("[.*().*]", "", myfeatsnames[1:79])

myfeatsnames = gsub("Acc", "Accelerator", myfeatsnames[1:79])
myfeatsnames = gsub("Mag", "Magnitude", myfeatsnames[1:79])
myfeatsnames = gsub("Gyro", "Gyroscope", myfeatsnames[1:79])
myfeatsnames = gsub("^t", "time", myfeatsnames[1:79])
myfeatsnames = gsub("^f", "frequency", myfeatsnames[1:79])


##Coerce the proper dimensionality of the feature list
dim(myfeatsnames) <- c(1,79)



##Load training data
##Extract only the measurements on the mean and standard deviation 
##for each measurement
##Appropriately label the data set with descriptive variable names
mytrain1 <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))[myfeats3]
names(mytrain1) <- myfeatsnames
mytrain2 <- tbl_df(read.table("UCI HAR Dataset/train/Y_train.txt"))
colnames(mytrain2) <- "Activities"
mytrain3 <- tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
colnames(mytrain3) <- "Subject Number"
mytrain4 <- tbl_df(cbind(mytrain3, mytrain2, mytrain1))

  
##Load testing data  
##Extract only the measurements on the mean and standard deviation 
##for each measurement
##Appropriately label the data set with descriptive variable names
mytest1 <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))[myfeats3]
names(mytest1) <- myfeatsnames
mytest2 <- tbl_df(read.table("UCI HAR Dataset/test/Y_test.txt"))
colnames(mytest2) <- "Activities"
mytest3 <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))
colnames(mytest3) <- "Subject Number"
mytest4 <- tbl_df(cbind(mytest3, mytest2, mytest1))

##Merge the training and the test sets to create one data set
mydata <- tbl_df(rbind(mytrain4, mytest4))

##Use descriptive activity names to name the activities in the data set
mydata$"Activities"[mydata$"Activities" == 1] <- "Walking"
mydata$"Activities"[mydata$"Activities" == 2] <- "Walking Up Stairs"
mydata$"Activities"[mydata$"Activities" == 3] <- "Walking Down Stairs"
mydata$"Activities"[mydata$"Activities" == 4] <- "Sitting"
mydata$"Activities"[mydata$"Activities" == 5] <- "Standing"
mydata$"Activities"[mydata$"Activities" == 6] <- "Laying"


##Create a second, independent tidy data set with the average of each 
##variable for each activity and each subject

##Take averages for each activity
Average_Walking <- sapply(filter(mydata[3:81], mydata$"Activities" == "Walking"), mean)
Average_Walking_Up <- sapply(filter(mydata[3:81], mydata$"Activities" == "Walking Up Stairs"), mean)
Average_Walking_Down <- sapply(filter(mydata[3:81], mydata$"Activities" == "Walking Down Stairs"), mean)
Average_Sitting <- sapply(filter(mydata[3:81], mydata$"Activities" == "Sitting"), mean)
Average_Standing <- sapply(filter(mydata[3:81], mydata$"Activities" == "Standing"), mean)
Average_Laying <- sapply(filter(mydata[3:81], mydata$"Activities" == "Laying"), mean)

##Take averages for each subject
Average_Subject_1 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "1"), mean)
Average_Subject_2 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "2"), mean)
Average_Subject_3 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "3"), mean)
Average_Subject_4 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "4"), mean)
Average_Subject_5 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "5"), mean)
Average_Subject_6 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "6"), mean)
Average_Subject_7 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "7"), mean)
Average_Subject_8 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "8"), mean)
Average_Subject_9 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "9"), mean)
Average_Subject_10 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "10"), mean)
Average_Subject_11 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "11"), mean)
Average_Subject_12 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "12"), mean)
Average_Subject_13 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "13"), mean)
Average_Subject_14 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "14"), mean)
Average_Subject_15 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "15"), mean)
Average_Subject_16 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "16"), mean)
Average_Subject_17 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "17"), mean)
Average_Subject_18 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "18"), mean)
Average_Subject_19 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "19"), mean)
Average_Subject_20 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "20"), mean)
Average_Subject_21 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "21"), mean)
Average_Subject_22 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "22"), mean)
Average_Subject_23 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "23"), mean)
Average_Subject_24 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "24"), mean)
Average_Subject_25 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "25"), mean)
Average_Subject_26 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "26"), mean)
Average_Subject_27 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "27"), mean)
Average_Subject_28 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "28"), mean)
Average_Subject_29 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "29"), mean)
Average_Subject_30 <- sapply(filter(mydata[3:81], mydata$"Subject Number" == "30"), mean)

##Merge the two sets of averages

mydata2 <- cbind(Average_Walking, Average_Walking_Up, Average_Walking_Down, Average_Sitting, Average_Standing, Average_Laying, Average_Subject_1,
                 Average_Subject_2,
                 Average_Subject_3,
                 Average_Subject_4,
                 Average_Subject_5,
                 Average_Subject_6,
                 Average_Subject_7,
                 Average_Subject_8,
                 Average_Subject_9,
                 Average_Subject_10,
                 Average_Subject_11,
                 Average_Subject_12,
                 Average_Subject_13,
                 Average_Subject_14,
                 Average_Subject_15,
                 Average_Subject_16,
                 Average_Subject_17,
                 Average_Subject_18,
                 Average_Subject_19,
                 Average_Subject_20,
                 Average_Subject_21,
                 Average_Subject_22,
                 Average_Subject_23,
                 Average_Subject_24,
                 Average_Subject_25,
                 Average_Subject_26,
                 Average_Subject_27,
                 Average_Subject_28,
                 Average_Subject_29,
                 Average_Subject_30)

##Make Feature a labeled column rather than row names
## in accordance with tidy data theory

Feature <- rownames(mydata2)
rownames(mydata2) <- NULL
mydata2 <- cbind(Feature, mydata2)


##First tidy data set:
View(mydata)

##Second tidy data set
View(mydata2)
