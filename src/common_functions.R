# common_functions.R

open_png <- function(filename, width = 960, height = 540) {
  # This function opens a PNG device for graphics output.
  png(filename, width = width, height = height)
}

wirte_cluster_results = function(
  simulated_data, 
  cluster_result,
  algorithm_name,
  combination_order,
  parameter_order) {
  
  # This is a function to write cluster results
  simulated_data$cluster <- cluster_result
  
  output_name <- paste(
    "outputs/clustering_results/simulated_data/feature_combination_",
    combination_order,
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

read_cluster_results = function(algorithm_name,
                                combination_order,
                                parameter_order) {
  file_name <- paste(
    "outputs/clustering_results/simulated_data/feature_combination_",
    combination_order,
    "/",
    algorithm_name,
    "/",
    "parameter_", 
    parameter_order,
    "_cluster_results.csv",
    sep = ""
  )
  cluster_results <- read.csv(file_name)
}
