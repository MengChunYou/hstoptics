# generate_3d_plots.R

library(plot3D)

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
  plot3D::scatter3D(
    simulated_data$x, simulated_data$y, simulated_data$t,  
    xlab = "c", ylab = "y", zlab = "t",
    col = "blue", pch = 19, cex = 0.5, theta = 15, phi = 20)
  
  # Close the PNG device
  dev.off()
}

