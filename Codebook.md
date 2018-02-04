Variables and data sets used in performing calculations related to the Cleaning Data Project

features_tbl: Table to store the feature names
subject_train_tbl: Table to store the Subject information in training set. Column name renamed to Subject.
x_train_tbl : Table to store the measurements calculated for the training set population
y_train_tbl : Table to store the activities performed by the training set population. Column name renamed to Activity
training_set : Table formed by combining Subject, Activity and measurements for the training set population
subject_test_tbl: Table to store the Subject information in test set. Column name renamed to Subject.
x_test_tbl : Table to store the measurements calculated for the test set population
y_test_tbl : Table to store the activities performed by the test set population. Column name renamed to Activity
test_set : Table formed by combining Subject, Activity and measurements for the test set population
combined_data_set: Table formed by merging training and test sets.
valid_column_names : Unique column names created in the merged set
mean_std_data: Data set created to extract the mean and standard deviation of each measurement.Column names for the mean and std measurements are modified to provide descriptive names.
activity_names: Character vector indicating the activity names.This is used in providing descriptive names for activities in the mean_std_data set
grouped_avg_data : mean_std_data grouped by Subject and Activity
summarised_data : Summarised data set which gives the average of each measurement for each activity and subject
final_summarised_data.txt: Text file containing the Summarised data set

