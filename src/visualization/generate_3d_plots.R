# generate_3d_plots.R

library(scatterplot3d)     

# Loop through each file
for (ii in 1:7) {
  
  # Read the CSV file
  simulated_data <- read.csv(
    paste(
      "simulated_data/feature_combination_", 
      ii,
      ".csv",
      sep = ""))
  
  # Set plotting parameters
  plot_lim <- 10
  point_col <- rgb(0.3, 0.3, 0.3, 0.2)
  projection_col <- rgb(0.8,0.8,0.8,0.2)
  lim <- c(-1 * plot_lim, plot_lim)
  
  # Generate simulated data with projection
  simulated_data_w_projection <- simulated_data %>% 
    rbind(., simulated_data)
  simulated_data_w_projection[1:nrow(simulated_data),"t"] <- -0.99 * plot_lim
  
  # Open a PNG device for graphics output
  open_png(paste(
    "outputs/descriptive_statistics/3d/",
    "feature_combination_",
    ii,
    "_3d_plot.png",
    sep = ""
  ))
  
  # Create a 3D scatter plot
  scatterplot3d(simulated_data_w_projection, 
                pch = 16, asp = T, 
                color = rep(c(projection_col, point_col), 
                              each = nrow(simulated_data)), 
                xlim = lim, 
                ylim = lim, 
                zlim = lim, 
                cex.symbols = 1.5, cex.axis = 1.5, cex.lab = 1.5)
  
  # Close the PNG device
  dev.off()
}