# setwd("C://Work/Coursera/GCD/UCI HAR Dataset")

# 1. Merge training and test sets
train <- read.table("./train/X_train.txt")
train.label <- read.table("./train/y_train.txt")
train.subject <- read.table("./train/subject_train.txt")
test <- read.table("./test/X_test.txt")
test.label <- read.table("./test/y_test.txt")
test.subject <- read.table("./test/subject_test.txt")

dat <- rbind(train, test)
dat.label <- rbind(train.label, test.label)
dat.subject <- rbind(train.subject, test.subject)

# 2. Extract only the measurements on the mean and sd. for each measurement
feat <- read.table("features.txt")
mean.sd.index <- grep("mean\\(\\)|std\\(\\)", feat[, 2])  # regular expression
mean.sd.index
dat.ms <- dat[, mean.sd.index]

names(dat.ms)
names(dat.ms) <- gsub("\\(\\)", "", feat[mean.sd.index, 2])
names(dat.ms)

#3. Uses descriptive activity names to name the activities in the dataset
activity <- read.table("activity_labels.txt")
activity.label <- activity[dat.label[,1],2]
dat.label[,1] <- activity.label
str(dat.label)

#4. Appropriately labels the dataset with descriptive variable names
names(dat.subject)
names(dat.subject) <- "Subject"
names(dat.subject)
names(dat.label)
names(dat.label) <- "Activity"
names(dat.label)

dat.final <- cbind(dat.subject, dat.label, dat.ms)
dim(dat.final)
names(dat.final)

write.table(dat.final, "tidy data.txt", row.names=FALSE)

#5. Create a second, independent tidy dataset with the average of each variable for each activity and each subject
summary(dat.subject)
len.subject <- length(table(dat.subject))

dim(len.activity)
len.activity <- dim(activity)[1]

dim(dat.final)
len.column <- dim(dat.final)[2]

df <- matrix(NA, nrow=len.subject * len.activity, ncol=len.column)
df <- as.data.frame(df)
colnames(df) <- colnames(dat.final)
names(df)

row.number <- 1
for (i in 1:len.subject){
     for (j in 1:len.activity){
          df[row.number, 1] <- sort(unique(dat.subject)[,1])[i]
          df[row.number, 2] <- activity[j, 2]
          q1 <- i == dat.final$Subject
          q2 <- activity[j, 2] == dat.final$Activity
          df[row.number, 3:len.column] <- colMeans(dat.final[q1&q2, 3:len.column])
          row.number <- row.number + 1
     }
}

View(df)
write.table(df, "tidy data with means.txt", row.names=FALSE)
