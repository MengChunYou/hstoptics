# main_script.R

# 1: Simulation
source("src/simulation.R")

# 2: Data Processing
source("src/data_processing.R")

# 3: Descriptive Statistics
source("src/descriptive_statistics/simulated_data/generate_3d_plots.R")
source("src/descriptive_statistics/empirical_data/filtered_data_visualization.R")

# 4: Functions for Clustering Algorithms
source("src/clustering_algorithms/proposed_algorithm.R")
source("src/clustering_algorithms/stkde.R")
source("src/clustering_algorithms/tnkde.R")
source("src/clustering_algorithms/stdbscan.R")

# 5: Performing Clustering

## 5-1: Simulated Data
source("src/performing_clustering/simulated_data/proposed_algorithm/generate_cluster_results.R")
source("src/performing_clustering/simulated_data/proposed_algorithm/generate_cluster_3d_plot.R")

## 5-2: Empirical Data

### 5-2-1: Proposed Algorithm
source("src/performing_clustering/empirical_data/proposed_algorithm/generate_cluster_results.R")
source("src/performing_clustering/empirical_data/proposed_algorithm/generate_cluster_animation.R")

### 5-2-2: STKDE
source("src/performing_clustering/empirical_data/stkde/generate_cluster_results.R")
source("src/performing_clustering/empirical_data/stkde/generate_cluster_animation.R")

### 5-2-3: TNKDE
source("src/performing_clustering/empirical_data/tnkde/generate_cluster_results.R")
source("src/performing_clustering/empirical_data/tnkde/generate_cluster_animation.R")

### 5-2-4: STDBSCAN
source("src/performing_clustering/empirical_data/stdbscan/generate_cluster_results.R")
source("src/performing_clustering/empirical_data/stdbscan/generate_cluster_animation.R")

# 6: Sensitivity Analysis
source("src/sensitivity_analysis/empirical_data/proposed_algorithm/generate_cluster_results.R")
source("src/sensitivity_analysis/empirical_data/proposed_algorithm/generate_cluster_animation.R")

# End of main_script.R