
# Load reshape2 package
library(reshape2)

# load xtrain and xtest files
X.train <- read.table("train/X_train.txt")
X.test <- read.table("test/X_test.txt")

# load ytrain and ytest files
y.train <- read.table("train/y_train.txt")
y.test <- read.table("test/y_test.txt")

# load subject train and subject test files
subject.train <- read.table("train/subject_train.txt")
subject.test <- read.table("test/subject_test.txt")

# Load activity labels and features
activity.labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# merge train and test data
X.data <- rbind(X.train, X.test)
y.data <- rbind(y.train, y.test)
subject.data <- rbind(subject.train, subject.test)

# assign column names
names(X.data) <- features$V2  

# extract features involving mean and standard deviation 
mean.std.features <- grepl("(mean|std)\\(\\)", features$V2)
X.data <- X.data[,mean.std.features] 

# make variable names more descriptive
df.names <- names(X.data)
df.names <- gsub("\\(\\)","",df.names)
df.names <- gsub("\\-","",df.names)
df.names <- gsub("mean"," Mean ",df.names)
df.names <- gsub("std"," Std Dev ",df.names)
df.names <- gsub("BodyBody"," Body ",df.names)
df.names <- gsub("Body"," Body ",df.names)
df.names <- gsub("Gravity"," Gravity ",df.names)
names(X.data) <- df.names

all.data <- X.data

# make activity labels into a character vector
labels <- as.character(activity.labels[,2])

# merge activity and subject column
all.data$Activitiy <- labels[y.data[,1]]
all.data$SubjectID <- subject.data[,1]

# tidy data by making activity and subject factors
all.data$Activitiy <- as.factor(all.data$Activitiy)
all.data$SubjectID <- as.factor(all.data$SubjectID)

# make tidy data set with the average of each variable for each activity and each subject.
melt.data  <- melt(all.data, id= c("Activity", "SubjectID"), measure.vars = df.names)
tidy.data  <- dcast(melt.data, SubjectID + Activity ~ variable, mean)

# export tidy data to text file
write.table(tidy.data, "TidyData.txt", sep = "\t", row.names = FALSE)
