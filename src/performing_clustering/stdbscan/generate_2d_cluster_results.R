# generate_2d_cluster_results.R

## generate_stdbscan_cluster_results function
generate_stdbscan_cluster_results <- function(
  combination_order,
  eps,
  eps2,
  min_pts) {
  
  # Read simulated data
  simulated_data <- read_simulated_data(combination_order)
  simulated_data$t <- 0
  
  # Get cluster results 
  results <- stdbscan(simulated_data$x, simulated_data$y, simulated_data$t,
                      eps = eps, eps2 = eps2, minpts = min_pts)
  cluster_results <- simulated_data %>% 
    mutate(cluster = results$cluster)
  
  # Write cluster results 
  write_cluster_results(
    cluster_results,
    algorithm_name = "stdbscan",
    combination_order = combination_order,
    parameter_order = 1,
    dim = 2)
  
  # Create a 2D plot when the script is executed directly
  if (length(commandArgs(trailingOnly = TRUE)) == 0) {
    plot_cluster_results_2d(simulated_data, cluster_results)
  }
}

## generate cluster results

### feature_combination_1
generate_stdbscan_cluster_results(
  combination_order = 1,
  eps = 1,
  eps2 = 1,
  min_pts = 6
)

### feature_combination_2
generate_stdbscan_cluster_results(
  combination_order = 2,
  eps = 1,
  eps2 = 1,
  min_pts = 6
)

### feature_combination_3
generate_stdbscan_cluster_results(
  combination_order = 3,
  eps = 1,
  eps2 = 1,
  min_pts = 6
)

### feature_combination_4
generate_stdbscan_cluster_results(
  combination_order = 4,
  eps = 1,
  eps2 = 1,
  min_pts = 6
)

### feature_combination_5
generate_stdbscan_cluster_results(
  combination_order = 5,
  eps = 1,
  eps2 = 1,
  min_pts = 6
)

### feature_combination_6
generate_stdbscan_cluster_results(
  combination_order = 6,
  eps = 1,
  eps2 = 1,
  min_pts = 6
)

### feature_combination_7
generate_stdbscan_cluster_results(
  combination_order = 7,
  eps = 1,
  eps2 = 1,
  min_pts = 6
)
