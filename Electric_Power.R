    getwd()
    setwd('C:/Users/Manke/Documents/Github/Data_Analysis_Project1')
    getwd()

## Load the libraries needed.
    read_libs <- function() {
      library(rgdal) # R Geo-spatial Data Abstraction Library
      library(sf) #Simple Features for R
      library(sp) #Classes and Methods for Spatial Data
      library(dplyr) #A Grammar for Data Manipulation
      library(tidyr) #Tools for cleaning data
      library(data.table) #Tools for data manipulation
      library(lattice) #Lattice system
      library(ggplot2) #Plotting system
      library(datasets) #
    }

    read_libs()

## Downloads the file if it's not already available in the working directory
    if(!file.exists('./electric_power.zip')){
      project_data <- ('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip') %>%
        download.file(destfile = './electric_power.zip',
                      method = 'curl')
      } else {
        print('This file already exists')
        }

## Unzips the downloaded zip file
    zip_file <- './electric_power.zip' %>%
      unzip(files = NULL,
            list = FALSE)

## Converts .txt file into a readable data table
    elec_power <- './household_power_consumption.txt' %>%
      read.table(sep = ';',
                 col.name = c('Date', 'Time', 'Global_Active_Power', 
                              'Global_Reactive_Power', 'Voltage', 'Global_Intensity', 
                              'Sub_Metering_1', 'Sub_Metering_2', 'Sub_Metering_3')
                 
                 )
## Removes the first row, which is only the column names
    elec_power <- elec_power[-1,]
    View(elec_power)

## All the columns are the character data type.
    str(elec_power)
## Converts the Date column into the Date data type.
## '%d/%m/% turns the dates into the Year-Month-Day format (example: '2006-12-16')
    elec_power$Date <- as.Date(elec_power$Date, '%d/%m/%Y')
    str(elec_power)

## The rest of the columns are still the character type, so let's change that.
    elec_power$Time <- as.ITime(elec_power$Time)
## Date and Time are no longer characters, but the rest are.
    str(elec_power)    

## Shows the total number of days in the data table
## Doesn't contribute to anything in the code, really. Was done for fun and for testing purposes.
    number_of_dates <- list(elec_power$Date)[[1]] %>%
      unique() %>%
      length()
    number_of_dates

## We will only be using data from the dates 2007-02-01 and 2007-02-02. 
## One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
## WE ARE DOING THE ALTERNATIVE
## The desired dates set in a vector, as.Date is here because otherwise they would be characters instead
    desired_dates <- as.Date(c('2007-02-01', '2007-02-02'))

## Filters the dataset by the desired dates
## Returned with 'NA' if I hadn't done "as.Date" with desired_dates
    elec_date <- dplyr::filter(elec_power, Date %in% desired_dates)
    View(elec_date)
    str(elec_date)

## Just want to make the remaining columns integers
## Lists the remaining column names
    remaining_cols <- colnames(elec_date[,sapply(elec_date,is.character)])
    remaining_cols

## Changing the remaining columns from character to numeric
## Wanted to do something more efficient or "fancy" but went with the brute force approach due to time constraints
    elec_date$Global_Active_Power <- as.numeric(elec_date$Global_Active_Power) # measured in kilowatts
    elec_date$Global_Reactive_Power <- as.numeric(elec_date$Global_Reactive_Power) # measured in kilowatts
    elec_date$Voltage <- as.numeric(elec_date$Voltage) # measured in voltage
    elec_date$Global_Intensity <- as.numeric(elec_date$Global_Intensity) # measured in ampere
  # All 3 Sub Metering columns are measured in kilowatts
    elec_date$Sub_Metering_1 <- as.numeric(elec_date$Sub_Metering_1)
    elec_date$Sub_Metering_2 <- as.numeric(elec_date$Sub_Metering_2)
    elec_date$Sub_Metering_3 <- as.numeric(elec_date$Sub_Metering_3)
    str(elec_date)
    


