
setwd("/z/coursera/4-exploratoryDataAnalysis/week1/ExData_Plotting1")
#debug <- TRUE
debug <- FALSE

## module for the purpose of loading data 
filename <- "household_power_consumption.txt"
data <- read.table(filename,
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")
if (debug) 
{
    dim(data) # 2075259 9
}
attach(data)
## Only using data from the dates 2007-02-01 and 2007-02-02.
subset <- Date == "1/2/2007" | Date == "2/2/2007"
newData <- data[subset, ]
attach(newData)
x <- paste(Date, Time)
newData$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(newData) <- 1:nrow(newData)

if (debug) 
{
    dim(newData) # 2880   10
}
attach(newData)