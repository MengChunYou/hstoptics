# generate_plots.R

library(ggplot2)
library(scatterplot3d)     

# Loop through each file
for (ii in 1:5) {
  
  # Read the CSV file
  simulated_data <- 
    read.csv(paste(
      "simulated_data/feature_combination_", 
      ii,
      ".csv",
      sep = ""
    ))
  
  # Set plotting parameters
  plot_lim <- 10
  point_col <- rgb(0.3, 0.3, 0.3, 0.2)
  projection_col <- rgb(0.8,0.8,0.8,0.2)
  lim <- c(-1 * plot_lim, plot_lim)
  
  # Create a 2D scatter plot
  plot_2d <- ggplot(simulated_data, aes(x = x, y = y)) +
    geom_point(colour = point_col, size = 0.5, pch = 16) +
    theme_minimal() +
    xlim(lim) +
    ylim(lim) +
    coord_fixed()
  
  # Open a PNG device for graphics output
  open_png(
    paste(
      "outputs/descriptive_statistics/2d/",
      "feature_combination_",
      ii,
      "_2d_plot.jpg",
      sep = ""))
  
  # Create a 2D scatter plot
  plot_2d <- ggplot(simulated_data, aes(x = x, y = y)) +
    geom_point(colour = point_col, size = 3, pch = 16) +
    theme_minimal() +
    xlim(lim) +
    ylim(lim) +
    coord_fixed() +
    theme(
      axis.title.x = element_text(size = 16 * 1.5),
      axis.text.x = element_text(size = 14 * 1.5),
      axis.title.y = element_text(size = 16 * 1.5),
      axis.text.y = element_text(size = 14 * 1.5))
  print(plot_2d)
  
  # Close the PNG device
  dev.off()
  
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