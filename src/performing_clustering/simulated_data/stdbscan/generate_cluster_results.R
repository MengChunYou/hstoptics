# generate_cluster_results.R

library(rgl)
library(magrittr)

source("src/clustering_algorithms/stdbscan.R")

wirte_cluster_results = function(simulated_data, 
                                 cluster_result,
                                 algorithm_name,
                                 file_order,
                                 parameter_order) {
  
  # This is a function to write cluster results
  
  # Create a 3D plot when running the script interactively
  plot_color = c(rgb(0,0,1,0.2), rgb(0,1,0,0.2), rgb(1,0,0,0.2))
  plot_lim = 10
  
  if (interactive()) {
    simulated_data %>% 
      plot3d(aspect = F, col = plot_color[cluster_result],
             xlim = c(-1 * plot_lim, plot_lim), 
             ylim = c(-1 * plot_lim, plot_lim), 
             zlim = c(-1 * plot_lim, plot_lim))
  }
  simulated_data$cluster_result <- cluster_result
  
  output_name <- paste(
    "outputs/cluster_plots/simulated_data/feature_combination_",
    file_order,
    "/",
    algorithm_name,
    "/",
    "parameter_", 
    parameter_order,
    "_cluster_results.csv",
    sep = ""
  )
    
  write.csv( 
    simulated_data, 
    file = output_name,
    row.names = F)
  message(paste("write", output_name))
}

simulated_data <- read.csv("data/simulated/feature_combination_6.csv")

results <- stdbscan(simulated_data$x, simulated_data$y, simulated_data$t,
                    eps = 3.5, eps2 = 3.5, minpts = 150)

wirte_cluster_results(simulated_data,
                      results$cluster,
                      "stdbcan",
                      "6",
                      "1")