# main_script.R

# library packages
library(dplyr)
library(sf)
library(tidyr)

# Set working directory to source file location
setwd(dirname(rstudioapi::getSourceEditorContext()$path))

source("src/common_functions.R")

# 1: simulation
source("src/simulation.R")

# 2: data processing
source("src/data_processing.R")

# 3: descriptive statistics
source("src/descriptive_statistics/simulated_data/generate_3d_plots.R")
source("src/descriptive_statistics/empirical_data/filtered_data_visualization.R")

# 4: functions for clustering algorithms
source("src/clustering_algorithms/proposed_algorithm.R")
source("src/clustering_algorithms/stkde.R")
source("src/clustering_algorithms/tnkde.R")
source("src/clustering_algorithms/stdbscan.R")

# 5: performing clustering

## 5-1: simulated data

### 5-1-1: proposed algorithm
source("src/performing_clustering/simulated_data/proposed_algorithm/generate_cluster_results.R")
source("src/performing_clustering/simulated_data/proposed_algorithm/generate_cluster_3d_plot.R")

### 5-1-2: stkde
# source("src/performing_clustering/simulated_data/stkde/generate_cluster_results.R")
# source("src/performing_clustering/simulated_data/stkde/generate_cluster_3d_plot.R")

### 5-1-3: tnkde
# source("src/performing_clustering/simulated_data/tnkde/generate_cluster_results.R")
# source("src/performing_clustering/simulated_data/tnkde/generate_cluster_3d_plot.R")

### 5-1-4: stdbscan
source("src/performing_clustering/simulated_data/stdbscan/generate_cluster_results.R")
source("src/performing_clustering/simulated_data/stdbscan/generate_cluster_3d_plot.R")

## 5-2: empirical data

### 5-2-1: proposed algorithm
# source("src/performing_clustering/empirical_data/proposed_algorithm/generate_cluster_results.R")
# source("src/performing_clustering/empirical_data/proposed_algorithm/generate_cluster_animation.R")

### 5-2-2: stkde
# source("src/performing_clustering/empirical_data/stkde/generate_cluster_results.R")
# source("src/performing_clustering/empirical_data/stkde/generate_cluster_animation.R")

### 5-2-3: tnkde
# source("src/performing_clustering/empirical_data/tnkde/generate_cluster_results.R")
# source("src/performing_clustering/empirical_data/tnkde/generate_cluster_animation.R")

### 5-2-4: stdbscan
# source("src/performing_clustering/empirical_data/stdbscan/generate_cluster_results.R")
# source("src/performing_clustering/empirical_data/stdbscan/generate_cluster_animation.R")

# end of main_script.R