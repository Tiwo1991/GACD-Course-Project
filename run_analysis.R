## for user: unzip raw data in folder called in your working directory

## install required packages

install.packages("dplyr")
install.packages("reshape2")

## paths to required files and miscellaneous 

path1 <- file.path("UCI HAR Dataset", "features.txt")
path2 <- file.path("UCI HAR Dataset", "train", "X_train.txt")
path3 <- file.path("UCI HAR Dataset", "train", "y_train.txt")
path4 <- file.path("UCI HAR Dataset", "train", "subject_train.txt")
path5 <- file.path("UCI HAR Dataset", "test", "x_test.txt")
path6 <- file.path("UCI HAR Dataset", "test", "y_test.txt")
path7 <- file.path("UCI HAR Dataset", "test", "subject_test.txt")
path8 <- file.path("UCI HAR Dataset", "activity_labels.txt")

label1 <- "WALKING"
label2 <- "WALKING_UPSTAIRS"
label3 <- "WALKING_DOWNSTAIRS"
label4 <- "SITTING"
label5 <- "STANDING"
label6 <- "LAYING"

variableNames <- read.table(path1)
variableNames[,2] = gsub('-mean', 'Mean', variableNames[,2])
variableNames[,2] = gsub('-std', 'Std', variableNames[,2])
variableNames[,2] = gsub('[-()]','', variableNames[,2])

## create dfTrain

variableContents <- read.table(path2)
names(variableContents) <- variableNames[,2]
activityPerformed <- read.table(path3)
colnames(activityPerformed) <- "Activity"

        activityPerformed[activityPerformed == 1] <- label1
        activityPerformed[activityPerformed == 2] <- label2
        activityPerformed[activityPerformed == 3] <- label3
        activityPerformed[activityPerformed == 4] <- label4
        activityPerformed[activityPerformed == 5] <- label5
        activityPerformed[activityPerformed == 6] <- label6

subjects1 <- read.table(path4)
colnames(subjects1) <- "Subject"
dfTrain <- cbind(subjects1, activityPerformed, variableContents)

## create dfTest

variableContents2 <- read.table(path5)
names(variableContents2) <- variableNames[,2]
activityPerformed2 <- read.table(path6)
colnames(activityPerformed2) <- "Activity"

        activityPerformed2[activityPerformed2 == 1] <- label1
        activityPerformed2[activityPerformed2 == 2] <- label2
        activityPerformed2[activityPerformed2 == 3] <- label3
        activityPerformed2[activityPerformed2 == 4] <- label4
        activityPerformed2[activityPerformed2 == 5] <- label5
        activityPerformed2[activityPerformed2 == 6] <- label6

subjects2 <- read.table(path7)
colnames(subjects2) <- "Subject"
dfTest <- cbind(subjects2, activityPerformed2, variableContents2)

## rbind dfTest to dfTrain

df <- rbind(dfTrain, dfTest)

## extract relevant variables and order df

library(dplyr)
        df <- tbl_df(df)
        df2 <- df[!duplicated(colnames(df))]
        df2 <- select(df2, Subject, Activity, contains("Mean"), contains("Std"))
        dfClean <- arrange(df2, Subject, Activity)

## create independent df with means

library(reshape2)
        dfCleanMean <- melt(dfClean, id.vars = c("Subject", "Activity"))
        dfCleanMean <- dcast(dfCleanMean, Subject+Activity ~ variable, fun.aggregate=mean)

## save datasets to separate files

write.table(dfClean, file = "tidyAll.txt", row.name=FALSE)
write.table(dfCleanMean, file = "tidyMean.txt", row.name=FALSE)