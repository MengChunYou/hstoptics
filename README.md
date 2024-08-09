# spatio-temporal-cluster-fault-identification

This repository contains R code, data, outputs, slides, and reports for a master's thesis titled "An OPTICS-based Algorithm for Identifying Spatio-Temporal Density Faults in Hierarchical Clustering Structures," completed in August 2024. The research introduces the HST-OPTICS algorithm, designed to detect hierarchical spatio-temporal clustering structures with density faults. All slides and reports are available in Traditional Chinese.

## Table of Contents

- [Project Abstract](#project-abstract)
- [Repository Structure](#repository-structure)
- [Required Packages](#required-packages)

## Project Abstract

The HST-OPTICS algorithm improves upon previous spatio-temporal clustering methods by identifying density faults in hierarchical clusters. This approach reveals complete clustering structures, including density differences and hierarchical relationships previously undetectable. The algorithm relaxes the OPTICS steepness definition, allowing for flexible identification of density fault ranges. It can detect overlapping clusters with varying density, hierarchical structures where multiple clusters belong to one cluster, and clustering structures with varying spatial ranges. HST-OPTICS produces clusters with noise exclusion, an undefined total count, clear boundaries, and arbitrary shapes. Simulations have verified its effectiveness in identifying complex hierarchical spatio-temporal clustering structures. Future work could explore practical applications, the design of verification metrics, and efficiency improvements.

## Repository Structure

```plaintext
root/
 ├── simulated_data/
 │    ├── feature_combination_1.csv
 │    ├── feature_combination_2.csv
 │    ├── feature_combination_3.csv
 │    ├── feature_combination_4.csv
 │    ├── feature_combination_5.csv
 │    ├── feature_combination_6.csv
 │    └── feature_combination_7.csv
 │
 ├── src/
 │    ├── common_functions.R
 │    ├── simulation.R
 │    ├── clustering_algorithms/
 │    │    ├── proposed_algorithm.R
 │    │    └── stdbscan.R
 │    │
 │    ├── performing_clustering/
 │    │    ├── proposed_algorithm/
 │    │    │    ├── generate_2d_cluster_results.R
 │    │    │    └── generate_3d_cluster_results.R
 │    │    │
 │    │    └── stdbscan/
 │    │          └── ...
 │    │
 │    └── visualization/
 │          ├── descriptive_statistics/
 │          │    ├── generate_2d_plots.R
 │          │    └── generate_3d_plots.R
 │          ├── cluster_plots/
 │          │    ├── generate_2d_cluster_plots.R
 │          │    └── generate_3d_cluster_plots.R
 │          └── cluster_structures/
 │                ├── generate_2d_cluster_structures.R
 │                └── generate_3d_cluster_structures.R
 │
 ├── outputs/
 │    ├── descriptive_statistics/
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1_2d_plot.png
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          ├── feature_combination_1_3d_plot.png
 │    │          └── ...
 │    │
 │    ├── parameters/
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1_parameters.csv
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          └── ...
 │    │
 │    ├── reachability_plots/
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── parameter_1_reachability_plot.png
 │    │    │    │    └── ...
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          └── ...
 │    │
 │    ├── clustering_results/
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── proposed_algorithm/
 │    │    │    │    │    ├── parameter_1_cluster_result.csv
 │    │    │    │    │    └── ...
 │    │    │    │    │ 
 │    │    │    │    └── stdbscan/
 │    │    │    │          └── parameter_1_cluster_result.csv
 │    │    │    │    
 │    │    │    ├── feature_combination_2/
 │    │    │    │    
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          └── ...
 │    │     
 │    ├── cluster_plots/
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── proposed_algorithm/
 │    │    │    │    │    ├── parameter_1_cluster_2d_plot.png
 │    │    │    │    │    └── ...
 │    │    │    │    │ 
 │    │    │    │    └── stdbscan/
 │    │    │    │          └── parameter_1_cluster_2d_plot.png
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          ├── feature_combination_1/
 │    │          │    ├── proposed_algorithm/
 │    │          │    │    ├── parameter_1_cluster_3d_plot.png
 │    │          │    │    └── ...
 │    │          │    │ 
 │    │          │    └── stdbscan/
 │    │          │          └── parameter_1_cluster_3d_plot.png
 │    │          └── ...
 │    │
 │    └── cluster_structures/
 │          ├── 2d/
 │          │    ├── feature_combination_1/
 │          │    │    ├── edge_lists/
 │          │    │    │    ├── parameter_1_cluster_edge_list.csv
 │          │    │    │    └── ...
 │          │    │    │
 │          │    │    └── tree_diagrams/
 │          │    │          ├── parameter_1_cluster_tree_diagram.png
 │          │    │          └── ...
 │          │    └── ...
 │          │
 │          └── 3d/
 │                └── ...
 │
 ├── reports/
 │    ├── report.pdf
 │    └── slides.pdf
 │
 ├── main_script.R
 ├── README.md
 └── .gitignore
```

- `simulated_data/`: This directory contains simulated datasets used to evaluate the effectiveness of the clustering algorithm.
- `src/`: This directory contains R scripts for data simulation, implementation of the clustering algorithms, and visualization of results.
- `outputs/`: This directory contains plots of simulated data, parameters from sensitivity analysis, reachability plots generated by the HST-OPTICS algorithm, and clustering results from both HST-OPTICS and ST-DBSCAN. It also includes plots and visualizations that illustrate the resulting cluster structures.
- `reports/`: This directory contains the master's thesis report and presentation slides.

## Required Packages

- dplyr
- sf
- tidyr
- rgl
- ggplot2
- igraph
- MASS
- scatterplot3d

Download the required packages by running the following command in R:

``` plaintext
install.packages(c("dplyr", "sf", "tidyr", "rgl", "ggplot2", "igraph", "MASS", "scatterplot3d"))
```
