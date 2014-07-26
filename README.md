Readme
========================================================

This repository contains the result for the coursera cleaning and getting data course project.

In this project a data set from wearable computing was presented (see http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). The data presented are collected from the accelerometers from the Samsun Galaxy S smartphone. Full description and the dataset itself can be obtained from here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

According to the task presented the R file in this repository "run_analysis.R"" contains a method run(<basedir>)
that calculates a tidy dataset with mean values for all mean and std features collected per subject and activity - for combined training and test subjects. The method returns the resulting data frame and saves it in the same directory <basedir> were it expects the data sets as conained in the above mentioned zip file.
