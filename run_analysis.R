run_analysis <- function(){
        
        #Read all feature names from features.txt
        
        features_tbl <- read.table("UCI HAR Dataset/features.txt")
        
        #Preparing the training set by combining Subject, Activity and the measurments
        
        subject_train_tbl <- read.table("UCI HAR Dataset/train/subject_train.txt")
        x_train_tbl <- read.table("UCI HAR Dataset/train/X_train.txt")
        y_train_tbl <- read.table("UCI HAR Dataset/train/y_train.txt")
        subject_train_tbl <- subject_train_tbl %>% rename(Subject = V1)
        y_train_tbl <- y_train_tbl %>% rename(Activity = V1)
        colnames(x_train_tbl) <- features_tbl$V2[1:561]
        training_set <- cbind(subject_train_tbl,y_train_tbl,x_train_tbl)
        
        #Preparing the test set by combining Subject, Activity and the measurments
        
        subject_test_tbl <- read.table("UCI HAR Dataset/test/subject_test.txt")
        x_test_tbl <- read.table("UCI HAR Dataset/test/X_test.txt")
        y_test_tbl <- read.table("UCI HAR Dataset/test/y_test.txt")
        subject_test_tbl <- subject_test_tbl %>% rename(Subject = V1)
        y_test_tbl <- y_test_tbl %>% rename(Activity = V1)
        colnames(x_test_tbl) <- features_tbl$V2[1:561]
        test_set <- cbind(subject_test_tbl,y_test_tbl,x_test_tbl)
        
        #Merging the training and test set
        combined_data_set <- rbind(training_set,test_set)
        
        #Making the column names unique to use in the merged set
        valid_column_names <- make.names(names=names(combined_data_set), unique=TRUE, allow_ = TRUE)
        names(combined_data_set) <- valid_column_names
        
        #Select the required mean and std measurements from the merged set
        mean_std_data <- combined_data_set %>% select(Subject,Activity,grep("mean|std",names(combined_data_set)))
        
        #Give descriptive activity names in the mean_std_data set
        activity_names <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
        mean_std_data$Activity <- activity_names[mean_std_data$Activity]
        
        #Give descriptive names for the measurement columns in the data set
        names(mean_std_data) <- gsub("tBodyAcc","time body acceleration",names(mean_std_data))
        names(mean_std_data) <- gsub("tGravityAcc","time gravity acceleration",names(mean_std_data))
        names(mean_std_data) <- gsub("tBodyGyro","time body gyroscope",names(mean_std_data))
        names(mean_std_data) <- gsub("fBodyAcc","frequency body acceleration",names(mean_std_data))
        names(mean_std_data) <- gsub("fBodyGyro","frequency body gyroscope",names(mean_std_data))
        names(mean_std_data) <- gsub("fBodyBodyAcc","frequency body body acceleration",names(mean_std_data))
        names(mean_std_data) <- gsub("fBodyBodyGyro","frequency body body gyroscope",names(mean_std_data))
        
        #Group the data based on Subject and Activity. Calculate the average for each measurement and write the final data set to a txt file.
        grouped_avg_data <- mean_std_data %>% group_by(Subject,Activity)
        summarised_data <- summarise_all(grouped_avg_data,mean)
        write.table(summarised_data,"final_summarised_data.txt",row.names = FALSE)
}