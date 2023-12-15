# generate_cluster_results.R

library(rgl)
library(magrittr)

source("src/clustering_algorithms/stdbscan.R")

simulated_data <- read.csv("data/simulated/feature_combination_6.csv")

results <- stdbscan(simulated_data$x, simulated_data$y, simulated_data$t,
                    eps = 3.5, eps2 = 3.5, minpts = 150)

if (interactive()) {
  simulated_data %>% 
    plot3d(aspect = F, col = plot_color[results$cluster],
           xlim = c(-1 * plot_lim, plot_lim), 
           ylim = c(-1 * plot_lim, plot_lim), 
           zlim = c(-1 * plot_lim, plot_lim))
}

wirte_cluster_results(simulated_data,   
                      results$cluster,
                      algorithm_name = "stdbscan",
                      combination_order = "6",
                      parameter_order = "1")