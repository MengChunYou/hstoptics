# generate_2d_plots.R

library(ggplot2)

# Loop through each file
for (ii in 1:7) {
  
  # Read the CSV file
  simulated_data <- read.csv(
    paste(
      "simulated_data/feature_combination_", 
      ii,
      ".csv",
      sep = ""))
  
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
}