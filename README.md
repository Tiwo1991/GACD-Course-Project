# GACD-Course-Project
COURSERA - Data Science Specialization, Getting and Cleaning Data, Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean 
a data set. The goal is to prepare tidy data that can be used for later analysis. 

# Raw Data Source

The data linked to from the course website represent data collected from the accelerometers 
from the Samsung Galaxy S smartphone. A full description is available at the 
site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Data for the project: 

Actual raw data used for this project can be found at the following link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Files in this repo and their relationships

README.md
	General introduction/information regarding course project

CodeBook.md
	Contains explanation of the variables, those kept and dropped for the purpose of the assignment,
	and actions performed on the raw data to make the required data sets. 
	
run_analysis.R 
	R script which cleans raw data according to course project requirements:
		1. installs required packages
		2. creates paths to required files
		3. creates 1 tidy data set containing all variables relevant to the project 
		sorted by subject and activity performed
		4. creates 1 tidy data set containing the means of all relevant variables to the project
		sorted by subject and activity performed. 
		5. saves both datasets to working directory