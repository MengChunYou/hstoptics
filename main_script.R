# main_script.R

# Library packages
library(dplyr)
library(sf)
library(tidyr)

# Set working directory to source file location
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

source("src/common_functions.R")

# 1: Simulation
source("src/simulation.R")

# 2: Descriptive statistics

## 2-1: Two dimensions
source("src/visualization/descriptive_statistics/generate_2d_plots.R")

## 2-2: Three dimensions
source("src/visualization/descriptive_statistics/generate_3d_plots.R")

# 3: Functions for clustering algorithms
source("src/clustering_algorithms/proposed_algorithm.R")
source("src/clustering_algorithms/stdbscan.R")

# 4: Performing clustering

## 4-1: Two dimensions
source("src/performing_clustering/proposed_algorithm/generate_2d_cluster_results.R")
source("src/performing_clustering/stdbscan/generate_2d_cluster_results.R")

## 4-2: Three dimensions
source("src/performing_clustering/proposed_algorithm/generate_3d_cluster_results.R")
source("src/performing_clustering/stdbscan/generate_3d_cluster_results.R")

# 5: Generate cluster plots

## 5-1: Two dimensions
source("src/visualization/cluster_plots/generate_cluster_2d_plots.R")

## 5-2: Three dimensions
source("src/visualization/cluster_plots/generate_cluster_3d_plots.R")

# 6: Generate cluster structures

## 6-1: Two dimensions
source("src/visualization/cluster_structures/generate_2d_cluster_structures.R")

## 6-2: Three dimensions
source("src/visualization/cluster_structures/generate_3d_cluster_structures.R")

# end of main_script.R