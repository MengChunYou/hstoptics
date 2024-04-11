# generate_cluster_3d_plot.R

library(scatterplot3d)  

## generate_stdbscan_cluster_3d_plot function
generate_stdbscan_cluster_3d_plot = function(
  combination_order,
  parameter_order) {
    simulated_data <- read_cluster_results(
      algorithm_name = "stdbscan",
      combination_order = combination_order,
      parameter_order = parameter_order)
    plot_color = c(rgb(0.8,0.8,0.8), rgb(0,0,1,0.2), rgb(0,1,0,0.2), rgb(1,0,0,0.2))
    plot_lim = 10
    
    # Add projected points
    simulated_data_w_projection <- simulated_data %>% 
      rbind(., simulated_data)
    simulated_data_w_projection[1:nrow(simulated_data),"t"] <- -0.99 * plot_lim
    
    # Open a PNG device for graphics output
    output_name <- paste(
      "outputs/cluster_plots/simulated_data/",
      "feature_combination_",
      combination_order,
      "/stdbscan/",
      "parameter_", parameter_order,
      "_cluster_3d_plot.png",
      sep = ""
    )
    open_png(output_name)
    
    # Create a 3D scatter plot
    scatterplot3d(simulated_data_w_projection[, 1:3], 
                  pch = 16, asp = T, 
                  color = c(rep(rgb(0.8,0.8,0.8,0.2), times = nrow(simulated_data)), 
                            plot_color[simulated_data$cluster + 1]), 
                  xlim = c(-1 * plot_lim, plot_lim), 
                  ylim = c(-1 * plot_lim, plot_lim), 
                  zlim = c(-1 * plot_lim, plot_lim), 
                  cex.symbols = 1.5, cex.axis = 1.5, cex.lab = 2)
    
    # Close the PNG device
    dev.off()
    
    message(paste("write", output_name))
}

## generate cluster 3d plot

### feature_combination_1
generate_stdbscan_cluster_3d_plot(
  combination_order = 1,
  parameter_order = 1)

### feature_combination_2
generate_stdbscan_cluster_3d_plot(
  combination_order = 2,
  parameter_order = 1)

### feature_combination_3
generate_stdbscan_cluster_3d_plot(
  combination_order = 3,
  parameter_order = 1)

### feature_combination_4
generate_stdbscan_cluster_3d_plot(
  combination_order = 4,
  parameter_order = 1)

### feature_combination_5
generate_stdbscan_cluster_3d_plot(
  combination_order = 5,
  parameter_order = 1)