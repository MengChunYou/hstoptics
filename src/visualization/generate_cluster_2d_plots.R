# generate_cluster_2d_plots.R

library(ggplot2)

generate_cluster_2d_plot = function(
  combination_order,
  parameter_order,
  algorithm_name) {
  
  # Read the CSV file
  simulated_data <- read_cluster_results(
    algorithm_name = algorithm_name,
    combination_order = combination_order,
    parameter_order = parameter_order,
    dim = 2)
  
  # Set plotting parameters
  plot_color = c(rgb(0.8,0.8,0.8), rgb(0,0,1,0.2), rgb(0,1,0,0.2), rgb(1,0,0,0.2))
  plot_lim = 10
  
  # Open a PNG device for graphics output
  output_name <- paste(
    "outputs/cluster_plots/2d/",
    "feature_combination_",
    combination_order,
    "/",
    algorithm_name,
    "/",
    "parameter_", parameter_order,
    "_cluster_2d_plot.png",
    sep = ""
  )
  open_png(output_name)
  
  # Create a 2D scatter plot
  plot_2d <- ggplot(simulated_data, aes(x = x, y = y)) +
    geom_point(
      colour = plot_color[simulated_data$cluster + 1], 
      size = 3, 
      pch = 16) +
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
  
  message(paste("write", output_name))
}

## generate proposed_algorithm cluster 3d plot
for (order in 1:5) {
  generate_cluster_2d_plot(
    combination_order = order,
    parameter_order = 1,
    algorithm_name = "proposed_algorithm")
}

## generate stdbscan cluster 3d plot
for (order in 1:5) {
  generate_cluster_2d_plot(
    combination_order = order,
    parameter_order = 1,
    algorithm_name = "stdbscan")
}
