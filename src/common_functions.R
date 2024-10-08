# common_functions.R
library(rgl)
library(ggplot2)
library(igraph)

open_png <- function(filename, width = 960, height = 540) {
  # This function opens a PNG device for graphics output.
  png(filename, width = width, height = height)
}

read_simulated_data <- function(combination_order){
  simulated_data <- read.csv(
    paste(
      "simulated_data/feature_combination_", combination_order,".csv", 
      sep = ""))
  return(simulated_data)
}

write_cluster_results <- function(
  cluster_results,
  algorithm_name,
  combination_order,
  parameter_order,
  dim) {
  
  # This is a function to write cluster results
  
  output_name <- paste(
    "outputs/clustering_results/",
    dim,
    "d/feature_combination_",
    combination_order,
    "/",
    algorithm_name,
    "/",
    "parameter_", 
    parameter_order,
    "_cluster_result.csv",
    sep = ""
  )
  
  write.csv( 
    cluster_results, 
    file = output_name,
    row.names = F)
  
  message(paste("write", output_name))
}

# Set plotting parameters
plot_lim <- 10
point_col <- rgb(0.2, 0.2, 0.2, 0.2)
projection_col <- rgb(0.8, 0.8, 0.8, 0.2)
lim <- c(-1 * plot_lim, plot_lim)

read_cluster_result = function(
  algorithm_name,
  combination_order,
  parameter_order,
  dim) {
  file_name <- paste(
    "outputs/clustering_results/",
    dim,
    "d/feature_combination_",
    combination_order,
    "/",
    algorithm_name,
    "/",
    "parameter_", 
    parameter_order,
    "_cluster_result.csv",
    sep = ""
  )
  cluster_results <- read.csv(file_name)
}

write_edge_list <- function(
    algorithm_name = 'proposed_algorithm', 
    combination_order, 
    parameter_order, 
    dim
) {
  # Read the CSV file
  cluster_result <- read_cluster_result(
    algorithm_name = algorithm_name,
    combination_order = combination_order,
    parameter_order = parameter_order,
    dim = dim
  )
  
  output_csv_dir <- paste(
    "outputs/cluster_structures/",
    dim, "d/",
    "feature_combination_", combination_order, "/",
    "edge_lists/",
    "parameter_", parameter_order, "_cluster_edge_list.csv",
    sep = ""
  )
  
  n_clusters <- ncol(cluster_result) - 4
  
  edge_list <- data.frame(node1 = character(), node2 = character(), stringsAsFactors = FALSE)
  
  # Early return if number of clusters is less than 2
  if (n_clusters < 2) {
    # Write the data frame to a CSV file
    write.csv(edge_list, file = output_csv_dir, row.names = FALSE)
    message(paste("write", output_csv_dir))
    return()
  }
  
  for (i in 1:(n_clusters - 1)) {
    for (j in (i + 1):n_clusters) {
      j_is_sub_cluster <- all(cluster_result[[paste('cluster', i, sep = '')]][cluster_result[[paste('cluster', j, sep = '')]] == 1] == 1)
      if (j_is_sub_cluster) {
        edge_list <- rbind(edge_list, data.frame(node1 = i, node2 = j))
      }
    }
  }
  
  edge_list <- edge_list[!duplicated(edge_list$node2, fromLast = TRUE), ]
  
  # Write the data frame to a CSV file
  write.csv(edge_list, file = output_csv_dir, row.names = FALSE)
  message(paste("write", output_csv_dir))
}

write_tree_diagram <- function(
    algorithm_name = 'proposed_algorithm', 
    combination_order, 
    parameter_order, 
    dim
) {
  
  # Construct the input file path for the edge list
  input_csv_dir <- paste(
    "outputs/cluster_structures/",
    dim, "d/",
    "feature_combination_", combination_order, "/",
    "edge_lists/",
    "parameter_", parameter_order, "_cluster_edge_list.csv",
    sep = ""
  )
  
  # Read the edge list CSV file
  edge_list <- read.csv(input_csv_dir)
  
  # Early return if there is no hierarchical structure
  if (nrow(edge_list) == 0) {
    return()
  }
  
  # Convert edge list to matrix and create graph
  g_from_edgelist <- edge_list %>% as.matrix() %>% graph_from_edgelist()
  
  output_png_dir <- paste(
    "outputs/cluster_structures/",
    dim, "d/",
    "feature_combination_", combination_order, "/",
    "tree_diagrams/",
    "parameter_", parameter_order, "_cluster_tree_diagram.png",
    sep = ""
  )
  open_png(output_png_dir)
  
  # Plot tree diagram
  plot(
    g_from_edgelist,
    layout = layout.reingold.tilford(g_from_edgelist, root = 1),
    vertex.color = "white",
    vertex.frame.width = 3,
    vertex.size = 60,
    vertex.label.cex = 6,
    vertex.label.family = 'sans',
    vertex.label.color = "black",
    edge.width = 3,
    edge.arrow.mode = 0
  )
  
  # Close the PNG device
  dev.off()
  
  message(paste("write", output_png_dir))
}

generate_reachability_plot = function(hst_optics_result){
  
  # This is a function to generate reachability plot
  replace(hst_optics_result$reach_score, hst_optics_result$reach_score == Inf, NA) %>% 
    ifelse(is.na(.), max(., na.rm = T) * 1.1, .) %>% 
    plot(., type = "h", ylab = "Reachability scores", xlab = "Order",
         col = ifelse(. == max(.), "lightgray", "black"))
}

write_reachability_plot <- function(
  hst_optics_result,
  faults,
  combination_order,
  parameter_order,
  dim
) {
  output_png_dir <- paste(
    "outputs/reachability_plots/", dim, "d/",
    "feature_combination_", combination_order,
    "/parameter_", parameter_order,
    "_reachability_plot.png",
    sep = ""
  )
  
  # Open a PNG device for graphics output
  open_png(output_png_dir)
  
  # Create reachability plot
  generate_reachability_plot(hst_optics_result)
  abline(v = which(faults==1), col = "red")
  abline(v = which(faults==-1), col = "blue")
  
  # Close the PNG device
  dev.off()
  
  message(paste("write", output_png_dir))
}

write_parameters <- function(
  parameters_df,
  combination_order,
  dim) {
  
  # This is a function to write parameters for sensitivity analysis
  output_csv_dir <- paste(
    "outputs/parameters/",
    dim,
    "d/feature_combination_", combination_order, "_parameters.csv",
    sep = ""
  )
  write.csv(parameters_df, file = output_csv_dir, row.names = FALSE)
  
  message(paste("write", output_csv_dir))
}

read_parameters <- function(
  combination_order,
  dim) {
  
  # This is a function to read parameters for sensitivity analysis
  file_name <- paste(
    "outputs/parameters/",
    dim,
    "d/feature_combination_", combination_order, "_parameters.csv",
    sep = ""
  )
  parameters_df <- read.csv(file_name)
  return(parameters_df)
}