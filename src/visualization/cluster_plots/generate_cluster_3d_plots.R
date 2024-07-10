# generate_cluster_3d_plots.R
dim <- 3

library(scatterplot3d)  

generate_cluster_3d_plot = function(
  combination_order,
  parameter_order,
  algorithm_name) {
  
  # Read the CSV file
  simulated_data <- read_cluster_result(
    algorithm_name = algorithm_name,
    combination_order = combination_order,
    parameter_order = parameter_order,
    dim = dim)
  
  # Set plotting parameters
  plot_color <- c(
    point_col, rgb(0, 0, 1, 0.2), rgb(0, 1, 0, 0.2), rgb(1, 0, 0, 0.2), 
    rgb(1, 1, 0, 0.2), rgb(1, 0, 1, 0.2), rgb(0, 1, 1, 0.2), rgb(0.5, 0.5, 0.5, 0.2), 
    rgb(0.5, 0, 0, 0.2), rgb(0, 0.5, 0, 0.2)
  )
  plot_lim = 10
  
  # Add projected points
  simulated_data_w_projection <- simulated_data %>% 
    rbind(., simulated_data)
  simulated_data_w_projection[1:nrow(simulated_data),"t"] <- -0.99 * plot_lim
  
  # Open a PNG device for graphics output
  output_name <- paste(
    "outputs/cluster_plots/", dim, "d/",
    "feature_combination_",
    combination_order,
    "/",
    algorithm_name,
    "/",
    "parameter_", parameter_order,
    "_cluster_3d_plot.png",
    sep = ""
  )
  open_png(output_name)
  
  # Create a 3D scatter plot
  scatterplot3d(
    simulated_data_w_projection[, 1:3], 
    pch = 16, asp = T, 
    color = c(rep(projection_col, times = nrow(simulated_data)), 
              plot_color[simulated_data$cluster + 1]), 
    xlim = c(-1 * plot_lim, plot_lim), 
    ylim = c(-1 * plot_lim, plot_lim), 
    zlim = c(-1 * plot_lim, plot_lim), 
    cex.symbols = 0.6, cex.axis = 1.5, cex.lab = 2)
  
  # Close the PNG device
  dev.off()
  
  message(paste("write", output_name))
}

## generate proposed_algorithm cluster 3d plot
for (combination_order in 1:7) {
  
  # Get parameter orders
  cluster_results_dir <- list.files(paste(
    'outputs/clustering_results/',
    dim, 'd/',
    'feature_combination_', combination_order, 
    '/proposed_algorithm',
    sep = ''
  ))
  parameter_orders <- as.numeric(gsub("[^0-9]", "", cluster_results_dir))
  
  for (parameter_order in parameter_orders) {
    generate_cluster_3d_plot(
      combination_order,
      parameter_order,
      algorithm_name = "proposed_algorithm")
  }
}

## generate stdbscan cluster 3d plot
for (combination_order in 1:7) {
  generate_cluster_3d_plot(
    combination_order,
    parameter_order=1,
    algorithm_name="stdbscan")
}
