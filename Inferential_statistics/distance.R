# Import libraries
library(mosaic)
library(ggplot2)

# Read raw data set
raw_ds <- read.csv("Banking Mobile App Usage Survey - English.csv")

# print the raw data frame
View(raw_ds)

# get column names
names(raw_ds)

# remove the rows that have null values
cleaned_ds <- na.omit(raw_ds)

# print the cleaned data set
View(cleaned_ds)

# Calculate sample mean 
sample_stat <- mean(~How.far..km..is.your.nearest.bank.branch..,data=cleaned_ds)
sample_stat

# Generate bootstrap samples
distance_boot <- do(1000)*mean(~How.far..km..is.your.nearest.bank.branch.. ,data=resample(cleaned_ds))

# Plot the bootstrap sample distribution
ggplot(data=distance_boot) + 
  geom_histogram(mapping = aes(x = mean)) +
  xlab("Means")

# Get the standard deviation of bootstrap sample distribution
SE <- sd(~mean, data=distance_boot);
SE

