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
  
  plot_lim = 10
  simulated_data_w_projection <- simulated_data %>% 
    rbind(., simulated_data)
  simulated_data_w_projection[1:nrow(simulated_data),"t"] <- -0.99 * plot_lim
  
  # Open a PNG device for graphics output
  open_png(paste(
    "outputs/descriptive_statistics/simulated_data/3d_plot/",
    "feature_combination_",
    ii,
    "_3d_plot.png",
    sep = ""
  ))
  
  # Create a 3D scatter plot
  scatterplot3d(simulated_data_w_projection, 
                pch = 16, asp = T, 
                color = rep(c(rgb(0.8,0.8,0.8,0.2), rgb(0,0,1,0.2)), 
                              each = nrow(simulated_data)), 
                xlim = c(-1 * plot_lim, plot_lim), 
                ylim = c(-1 * plot_lim, plot_lim), 
                zlim = c(-1 * plot_lim, plot_lim), 
                cex.symbols = 1.5, cex.axis = 1.5, cex.lab = 1.5)
  
  # Close the PNG device
  dev.off()
}

