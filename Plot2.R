## For each plot you should
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
## Name each of the plot files as plot1.pngplot1.png, plot2.pngplot2.png, etc.
## Create a separate R code file (plot1.Rplot1.R, plot2.Rplot2.R, etc.) that constructs the corresponding plot, 
# i.e. code in plot1.Rplot1.R constructs the plot1.pngplot1.png plot. 
# Your code file should include code for reading the data so that the plot can be fully reproduced. 
# You must also include the code that creates the PNG file.
## Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
## When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.

## Need this to have the x axis display the days of the week
    time_axis <- as.POSIXct(paste(elec_date$Date, elec_date$Time))

## Plot 2 (line graph)
## X Axis: Days of the week (Thursday, Friday, Saturday)
## Y Axis: Global Active Power (kilowatts)
    plot2_png <- function(){
      with(elec_date,
           plot(time_axis, Global_Active_Power,
                type = 'l',
                xlab = '',
                ylab = 'Global Activer Power (kilowatts)'
           ))
      dev.copy(png, file = 'plot2.png')
  # ALWAYS do dev.off() after dev.copy, otherwise the saved image cannot be viewed
      dev.off()
    }
    plot2_png()
    