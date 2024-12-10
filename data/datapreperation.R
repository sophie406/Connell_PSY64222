########### Data Preparation ##########

#raw data import
raw_data <- read.csv("/Users/sophieconnell/Desktop/coding/Alcoholdeath.csv")

### Cleaning Data ###
#Getting rid of unwanted columns 
data <- raw_data[ , -c(1, 2, 5, 6, 7, 9, 10, 11, 13, 14, 15)]

#Renaming columns 
names(data)[1] <- "Year"
print(data)

names(data)[2] <- "PersonsDeaths"
print(data)

names(data)[3] <- "MaleDeaths"
print(data)

names(data)[4] <- "FemaleDeaths"
print(data)

#Removing commas and convert columns to numeric
data$PersonsDeaths <- as.numeric(gsub(",", "", data$PersonsDeaths))
data$MaleDeaths <- as.numeric(gsub(",", "", data$MaleDeaths))
data$FemaleDeaths <- as.numeric(gsub(",", "", data$FemaleDeaths))

write.csv(data, "data/dataset.csv", row.names = FALSE)


