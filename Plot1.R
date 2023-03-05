## For each plot you should
## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
## Name each of the plot files as plot1.pngplot1.png, plot2.pngplot2.png, etc.
## Create a separate R code file (plot1.Rplot1.R, plot2.Rplot2.R, etc.) that constructs the corresponding plot, 
# i.e. code in plot1.Rplot1.R constructs the plot1.pngplot1.png plot. 
# Your code file should include code for reading the data so that the plot can be fully reproduced. 
# You must also include the code that creates the PNG file.
## Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
## When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.

## Plot 1 (histogram)
## GAP stands for Global Active Power
## X Axis: Global Active Power (kilowatts)
## Y Axis: Frequency
plot1_png <- function(){
  with(elec_date, hist(Global_Active_Power, 
                       main = 'Global Active Power', 
                       xlab = 'Global Activer Power (kilowatts)', 
                       col = 'orange'))
  dev.copy(png, file = 'plot1.png')
  # ALWAYS do dev.off() after dev.copy, otherwise the saved image cannot be viewed
  dev.off()
}
plot1_png()

