# generate_3d_plots.R

library(scatterplot3d)     

# Loop through each file
for (ii in 1:20) {
  # Read the CSV file
  simulated_data <- 
    read.csv(paste(
      "data/simulated/feature_combination_", 
      ii,
      ".csv",
      sep = ""
    ))
  
  # Open a PNG device for graphics output
  open_png(paste(
    "outputs/descriptive_statistics/simulated_data/3d_plot/",
    "feature_combination_",
    ii,
    "_3d_plot.png",
    sep = ""
  ))
  
  # Create a 3D scatter plot
  scatterplot3d(simulated_data, pch=16, asp = T, color = rgb(0,0,1,0.2), 
                xlim = c(-5, 5), ylim = c(-5, 5), zlim = c(-5, 5),
                cex.symbols = 1.5, cex.axis = 1.5, cex.lab = 1.5)
  
  # Close the PNG device
  dev.off()
}

