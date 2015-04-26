Explanation of the script run_analysis.R
=========================================

The script assumes the Samsung data is present in the working directory.

To run :
Download the script and open it with R Studio
Make sure you set the working directory to where the Samsung data is located ( the folder name of data is "getdata-projectfiles-UCI HAR Dataset").
Now source this R file. 

You need the dplyr package for running this file. It will install the dplyr package on ur system again, even if you do have the package already installed. Comment out line 79 if you already have it and dont want the dplyr package to be reinstalled.

We were asked to put the mean and std of the variables. I have grepped all variables having mean in their name, irrespective of case. So I get 88 variables per activity per person.


The script code already includes all explanation of the code in comments so feel free to read through it. In short, I have followed the steps exactly as given in assignment. I merge the two train and test sets together, extract only the std and mean columns, replace activity numbers with their names, calculate average of all required features, sort and arrange the data into a tidy data. 

