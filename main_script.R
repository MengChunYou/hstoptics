# main_script.R

# Library packages
library(dplyr)
library(sf)
library(tidyr)

# Set working directory to source file location
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

source("src/common_functions.R")

# 1: Simulation
# source("src/simulation.R")

# 2: Descriptive statistics
# source("src/descriptive_statistics/generate_plots.R")

# 3: Functions for clustering algorithms
source("src/clustering_algorithms/proposed_algorithm.R")
source("src/clustering_algorithms/stkde.R")
source("src/clustering_algorithms/stdbscan.R")

# 4: Performing clustering

## 4-1: Two dimensions

### 4-1-1: proposed algorithm
# source("src/performing_clustering/2d/proposed_algorithm/generate_cluster_results.R")
# source("src/performing_clustering/2d/proposed_algorithm/generate_cluster_plots.R")

### 4-1-2: stkde
# source("src/performing_clustering/2d/stkde/generate_cluster_results.R")
# source("src/performing_clustering/2d/stkde/generate_cluster_plots.R")

### 4-1-3: stdbscan
# source("src/performing_clustering/2d/stdbscan/generate_cluster_results.R")
# source("src/performing_clustering/2d/stdbscan/generate_cluster_plots.R")

## 4-2: Three dimensions

### 4-2-1: proposed algorithm
# source("src/performing_clustering/3d/proposed_algorithm/generate_cluster_results.R")
# source("src/performing_clustering/3d/proposed_algorithm/generate_cluster_plots.R")

### 4-2-2: stkde
# source("src/performing_clustering/3d/stkde/generate_cluster_results.R")
# source("src/performing_clustering/3d/stkde/generate_cluster_plots.R")

### 4-2-3: stdbscan
# source("src/performing_clustering/3d/stdbscan/generate_cluster_results.R")
# source("src/performing_clustering/3d/stdbscan/generate_cluster_plots.R")

# end of main_script.R