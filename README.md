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
 │    ├── feature_combination_6.csv
 │    └── feature_combination_7.csv
 │
 ├── src/
 │    ├── common_functions.R
 │    ├── simulation.R
 │    ├── clustering_algorithms/
 │    │    ├── proposed_algorithm.R
 │    │    ├── stdbscan.R
 │    │    └── stkde.R (WIP)
 │    │
 │    ├── performing_clustering/
 │    │    ├── proposed_algorithm/
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
 │    │    │    │    ├── stdbscan/
 │    │    │    │    │    └── parameter_1_cluster_result.csv
 │    │    │    │    │ 
 │    │    │    │    └── stkde/ (WIP)
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
 │    │    │    │    ├── stdbscan/
 │    │    │    │    │    └── parameter_1_cluster_2d_plot.png
 │    │    │    │    │ 
 │    │    │    │    └── stkde/ (WIP)
 │    │    │    │          └── parameter_1_cluster_2d_plot.png
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          ├── feature_combination_1/
 │    │          │    ├── proposed_algorithm/
 │    │          │    │    ├── parameter_1_cluster_3d_plot.png
 │    │          │    │    └── ...
 │    │          │    │ 
 │    │          │    ├── stdbscan/
 │    │          │    │    └── parameter_1_cluster_3d_plot.png
 │    │          │    │ 
 │    │          │    └── stkde/ (WIP)
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

- `reports/`: ...

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
