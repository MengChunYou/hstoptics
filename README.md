# spatio-temporal-cluster-fault-identification

project description ...

## Table of Contents

- [Project Abstract](#project-abstract)
- [Repository Structure](#repository-structure)
- [Required Packages](#required-packages)

## Project Abstract

project abstract ...

## Repository Structure

```plaintext
root/
 ├── simulated_data/
 │    ├── feature_combination_1.csv
 │    ├── feature_combination_2.csv
 │    ├── feature_combination_3.csv
 │    ├── feature_combination_4.csv
 │    ├── feature_combination_5.csv
 │    ├── feature_combination_6.csv (WIP)
 │    └── feature_combination_7.csv
 │
 ├── src/
 │    ├── common_functions.R
 │    ├── simulation.R (WIP)
 │    ├── clustering_algorithms/
 │    │    ├── proposed_algorithm.R
 │    │    ├── stdbscan.R
 │    │    └── stkde.R (WIP)
 │    │
 │    ├── performing_clustering/
 │    │    ├── proposed_algorithm/ (WIP)
 │    │    │    ├── generate_2d_cluster_results.R
 │    │    │    └── generate_3d_cluster_results.R
 │    │    │
 │    │    ├── stdbscan/
 │    │    │    └── ...
 │    │    │
 │    │    └── stkde/ (WIP)
 │    │          └── ...
 │    │
 │    └── visualization/
 │          ├── descriptive_statistics/
 │          │    ├── generate_2d_plots.R
 │          │    └── generate_3d_plots.R
 │          ├── cluster_plots/ (WIP)
 │          │    ├── generate_2d_cluster_plots.R
 │          │    └── generate_3d_cluster_plots.R
 │          └── cluster_structures/ (WIP, only for proposed method)
 │                ├── generate_2d_tree_diagrams.R
 │                └── generate_3d_tree_diagrams.R
 │
 ├── outputs/
 │    ├── descriptive_statistics/
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1_2d_plot.png
 │    │    │    ├── feature_combination_2_2d_plot.png
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          ├── feature_combination_1_3d_plot.png
 │    │          ├── feature_combination_2_3d_plot.png
 │    │          └── ...
 │    │
 │    ├── parameters/ (WIP, only for proposed method)
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1_parameters.csv
 │    │    │    ├── feature_combination_2_parameters.csv
 │    │    │    ├── ...
 │    │    │    └── feature_combination_7_parameters.csv
 │    │    │
 │    │    └── 3d/
 │    │          ├── feature_combination_1_parameters.csv
 │    │          ├── feature_combination_2_parameters.csv
 │    │          ├── ...
 │    │          └── feature_combination_7_parameters.csv
 │    │
 │    ├── reachability_plots/ (WIP, only for proposed method)
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── parameter_1_reachability_plot.png
 │    │    │    │    ├── parameter_2_reachability_plot.png
 │    │    │    │    ├── ...
 │    │    │    │    └── parameter_9_reachability_plot.png
 │    │    │    │    
 │    │    │    ├── feature_combination_2/
 │    │    │    │    └── ...
 │    │    │    │
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          └── ...
 │    │
 │    ├── clustering_results/ (WIP)
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── proposed_algorithm/
 │    │    │    │    │    ├── parameter_1_cluster_results.csv
 │    │    │    │    │    ├── parameter_2_cluster_results.csv
 │    │    │    │    │    ├── ...
 │    │    │    │    │    └── parameter_9_cluster_results.csv
 │    │    │    │    │ 
 │    │    │    │    ├── stdbscan/
 │    │    │    │    │    └── parameter_1_cluster_results.csv
 │    │    │    │    │ 
 │    │    │    │    └── stkde/
 │    │    │    │          └── parameter_1_cluster_results.csv
 │    │    │    │    
 │    │    │    ├── feature_combination_2/
 │    │    │    │    
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          └── ...
 │    │     
 │    ├── cluster_plots/ (WIP)
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── proposed_algorithm/
 │    │    │    │    │    ├── parameter_1_cluster_2d_plot.png
 │    │    │    │    │    ├── parameter_2_cluster_2d_plot.png
 │    │    │    │    │    ├── ...
 │    │    │    │    │    └── parameter_9_cluster_2d_plot.png
 │    │    │    │    │ 
 │    │    │    │    ├── stdbscan/
 │    │    │    │    │    └── parameter_1_cluster_2d_plot.png
 │    │    │    │    │ 
 │    │    │    │    └── stkde/
 │    │    │    │          └── parameter_1_cluster_2d_plot.png
 │    │    │    │    
 │    │    │    ├── feature_combination_2/
 │    │    │    │    
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          ├── feature_combination_1/
 │    │          │    ├── proposed_algorithm/
 │    │          │    │    ├── parameter_1_cluster_3d_plot.png
 │    │          │    │    ├── parameter_2_cluster_3d_plot.png
 │    │          │    │    ├── ...
 │    │          │    │    └── parameter_9_cluster_3d_plot.png
 │    │          │    │ 
 │    │          │    ├── stdbscan/
 │    │          │    │    └── parameter_1_cluster_3d_plot.png
 │    │          │    │ 
 │    │          │    └── stkde/
 │    │          │          └── parameter_1_cluster_3d_plot.png
 │    │          │    
 │    │          ├── feature_combination_2/
 │    │          │    
 │    │          └── ...
 │    │
 │    └── cluster_structures/ (WIP, only for proposed method)
 │          ├── 2d/
 │          │    ├── feature_combination_1/
 │          │    │    ├── edge_lists/
 │          │    │    │    ├── parameter_1_cluster_edge_list.csv
 │          │    │    │    ├── parameter_2_cluster_edge_list.csv
 │          │    │    │    ├── ...
 │          │    │    │    └── parameter_9_cluster_edge_list.csv
 │          │    │    │
 │          │    │    └── tree_diagrams/
 │          │    │          ├── parameter_1_cluster_edge_list.csv
 │          │    │          ├── parameter_2_cluster_edge_list.csv
 │          │    │          ├── ...
 │          │    │          └── parameter_9_cluster_edge_list.csv
 │          │    │
 │          │    ├── feature_combination_2/
 │          │    │    └── ...
 │          │    │    
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

- `reports/`: ...

## Required Packages

- dplyr
- MASS
- sf
- tidyr
- ggplot2

Download the required packages by running the following command in R:

``` plaintext
install.packages(c("dplyr", "MASS", "sf", "tidyr", "ggplot2"))
```
