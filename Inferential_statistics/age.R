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

# Calculate sample proportion 
sample_stat <- prop(~Which.age.group.do.you.belong.to.=="25 - 45",data=cleaned_ds)
sample_stat

# Generate bootstrap samples
gender_boot <- do(1000)*prop(~Which.age.group.do.you.belong.to.=="25 - 45",data=resample(cleaned_ds))

# Plot the bootstrap sample distribution
ggplot(data=gender_boot) + 
  geom_histogram(mapping = aes(x = prop_TRUE)) +
  xlab("Propotions")

# Get the standard deviation of bootstrap sample distribution
SE <- sd(gender_boot$prop_TRUE);
SE

