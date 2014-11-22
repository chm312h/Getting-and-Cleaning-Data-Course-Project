run<-function(){
    
    a<-read.table('./UCI HAR Dataset/test/X_test.txt')
    a1<-read.table('./UCI HAR Dataset/test/y_test.txt')
    a2<-read.table('./UCI HAR Dataset/test/subject_test.txt')
    b<-read.table('./UCI HAR Dataset/train/X_train.txt')
    b1<-read.table('./UCI HAR Dataset/train/y_train.txt')
    b2<-read.table('./UCI HAR Dataset/train/subject_train.txt')
    
    #4. Appropriately labels the data set with descriptive variable names. 
    varnameds<-read.table('./UCI HAR Dataset/features.txt')
    names(a) <- make.names(varnameds$V2)
    names(b) <- make.names(varnameds$V2)
    
    #3. Uses descriptive activity names to name the activities in the data set
    activity_ds<-read.table('./UCI HAR Dataset/activity_labels.txt')
    a$Activity<-activity_ds$V2[match(a1$V1,activity_ds$V1)]
    b$Activity<-activity_ds$V2[match(b1$V1,activity_ds$V1)]
    a$Subject<-a2$V1
    b$Subject<-b2$V1
    
    #1. Merges the training and the test sets to create one data set.
    c<-rbind(a,b)
    
    #2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    c_names<-names(c)
    c_names_mean_std<-c_names[grep('(mean|std)',c_names)]
    d<-c[,c('Activity','Subject',c_names_mean_std)]
    
    #5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    e<-aggregate(d[,!(names(d) %in% c('Activity','Subject'))],by=list(Activity=d$Activity,Subject=d$Subject),FUN=mean,na.rm=TRUE)
    
    #output
    write.table(e,file='output.txt',row.name=FALSE)
}