# common_functions.R

library(rgl)
library(ggplot2)

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

wirte_cluster_results <- function(
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
    "_cluster_results.csv",
    sep = ""
  )
  
  write.csv( 
    cluster_results, 
    file = output_name,
    row.names = F)
  
  message(paste("write", output_name))
}

plot_cluster_results_3d <- function(simulated_data, cluster_results){
  
  # This is a function to show cluster results in 3d plot
  plot_color <- c(rgb(0.8,0.8,0.8), rgb(0,0,1,0.2), rgb(0,1,0,0.2), rgb(1,0,0,0.2))
  plot_lim <- 10
  lim <- c(-1 * plot_lim, plot_lim)
  
  simulated_data %>% 
    plot3d(
      aspect = F, col = plot_color[cluster_results$cluster + 1],
      xlim = c(-1 * plot_lim, plot_lim), 
      ylim = c(-1 * plot_lim, plot_lim), 
      zlim = c(-1 * plot_lim, plot_lim))
}

plot_cluster_results_2d <- function(simulated_data, cluster_results){
  
  # This is a function to show cluster results in 2d plot
  plot_color = c(rgb(0.8,0.8,0.8,0.2), rgb(0,0,1,0.2), rgb(0,1,0,0.2), rgb(1,0,0,0.2))
  plot_lim <- 10
  lim <- c(-1 * plot_lim, plot_lim)
  
  ggplot(simulated_data, aes(x = x, y = y)) +
    geom_point(
      colour = plot_color[cluster_results$cluster + 1], 
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
}

read_cluster_results = function(
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
    "_cluster_results.csv",
    sep = ""
  )
  cluster_results <- read.csv(file_name)
}
