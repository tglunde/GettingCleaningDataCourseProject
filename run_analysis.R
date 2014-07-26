run <- function(basedir) {
  
  #Reading feature set names from provided label text file and creating 
  # a second vector features_sel having indexes for features containing mean or std as per definition 
  features <- read.table(file.path(basedir, "features.txt"))
  features_sel <- grep("-mean\\(\\)|-std\\(\\)", features[,2])
  
  #Reading activity labels from provided label file
  activities <- read.table(file.path(basedir, "activity_labels.txt"))
  
  #reading data sets provided for X:=values, Y:=activity and S:=subjects combining train and test sets with rbind
  X <- rbind(read.table(file.path(basedir,"train/X_train.txt")), read.table(file.path(basedir,"test/X_test.txt")))
  Y <- rbind(read.table(file.path(basedir,"train/Y_train.txt")), read.table(file.path(basedir, "test/Y_test.txt")))
  S <- rbind(read.table(file.path(basedir,"train/subject_train.txt")), read.table(file.path(basedir, "test/subject_test.txt")))
  
  #Reducing columns by indexes of features containing mean or std values
  c <- X[,features_sel]
  #Feature column naming
  #removing brackets, replacing '-' with '_' and using only upper case - as per our naming conventions (see readme)
  names(c) <- gsub("-","_", gsub("\\(|\\)","", toupper(features[features_sel,2])))
  
  #Merging the acvitity labels into the combined train and test value set - building a factor for activity
  Ynew <- merge(Y, activities, by="V1")[2]
  names(Ynew) <- c("ACTIVITY")
  
  #naming the subject column and building a factor
  names(S) <- c("SUBJECT")
  S$SUBJECT <- as.factor(S$SUBJECT)

  #combining all thread sets using cbind to one resultset
  c <- cbind(S, Ynew, c)
  
  #using reshape library to melt and than re-combine the feature values per subject and activity 
  # building mean values per feature
  library(reshape2)
  d <- dcast(melt(c, id=c("SUBJECT","ACTIVITY")), SUBJECT + ACTIVITY ~ variable, mean)
  
  #writing the result into the filesystem
  write.table(d, file.path(basedir, "result.csv"), row.names=FALSE, quote=FALSE, sep=",")
  
  #returning the clean data set for further investigation
  d
}