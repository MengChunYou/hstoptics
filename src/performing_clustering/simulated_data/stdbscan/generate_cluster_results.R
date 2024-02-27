# generate_cluster_results.R

library(rgl)
library(magrittr)

## generate_stdbscan_cluster_results function
generate_stdbscan_cluster_results = function(
  combination_order,
  eps,
  eps2,
  minpts) {
  simulated_data <- read.csv(
    paste(
      "data/simulated/feature_combination_", combination_order,".csv", 
      sep = ""))
  results <- stdbscan(simulated_data$x, simulated_data$y, simulated_data$t,
                      eps = eps, eps2 = eps2, minpts = minpts)
  
  wirte_cluster_results(
    simulated_data,   
    results$cluster,
    algorithm_name = "stdbscan",
    combination_order = combination_order,
    parameter_order = "1")
  
  # Create a 3D plot when the script is executed directly
  if (length(commandArgs(trailingOnly = TRUE)) == 0) {
    plot_color = c(rgb(0.8,0.8,0.8), rgb(0,0,1,0.2), rgb(0,1,0,0.2), rgb(1,0,0,0.2))
    plot_lim = 10
    
    simulated_data %>% 
      plot3d(aspect = F, col = plot_color[results$cluster + 1],
             xlim = c(-1 * plot_lim, plot_lim), 
             ylim = c(-1 * plot_lim, plot_lim), 
             zlim = c(-1 * plot_lim, plot_lim))
  }
}

## generate cluster results

### feature_combination_1
generate_stdbscan_cluster_results(
  combination_order = 1,
  eps = 3,
  eps2 = 3,
  minpts = 150)

### feature_combination_6
generate_stdbscan_cluster_results(
  combination_order = 6,
  eps = 3,
  eps2 = 3,
  minpts = 150)

### feature_combination_11
generate_stdbscan_cluster_results(
  combination_order = 11,
  eps = 3,
  eps2 = 3,
  minpts = 150)

### feature_combination_16
generate_stdbscan_cluster_results(
  combination_order = 16,
  eps = 3,
  eps2 = 3,
  minpts = 150)
