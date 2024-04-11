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
 │    └── feature_combination_5.csv
 │
 ├── src/
 │    ├── common_functions.R
 │    ├── simulation.R
 │    ├── descriptive_statistics/
 │    │    └── generate_plots.R (WIP)
 │    │ 
 │    ├── clustering_algorithms/
 │    │    ├── proposed_algorithm.R
 │    │    ├── stdbscan.R
 │    │    └── stkde.R (WIP)
 │    │
 │    └── performing_clustering/ (WIP)
 │          ├── 2d/ (WIP)
 │          │    ├── proposed_algorithm/
 │          │    │    ├── generate_cluster_results.R
 │          │    │    └── generate_cluster_plots.R
 │          │    │
 │          │    ├── stdbscan/
 │          │    │    └── ...
 │          │    │
 │          │    └── stkde/
 │          │          └── ...
 │          │
 │          └── 3d/
 │                ├── proposed_algorithm/
 │                │    ├── generate_cluster_results.R
 │                │    └── generate_cluster_plots.R
 │                │
 │                ├── stdbscan/
 │                │
 │                └── stkde/
 │     
 ├── outputs/
 │    ├── descriptive_statistics/
 │    │    ├── 2d/ (WIP)
 │    │    │    ├── feature_combination_1_2d_plot.png
 │    │    │    ├── feature_combination_2_2d_plot.png
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          ├── feature_combination_1_3d_plot.png
 │    │          ├── feature_combination_2_3d_plot.png
 │    │          └── ...
 │    │
 │    ├── cluster_results/ (WIP)
 │    │    ├── 2d/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── proposed_algorithm/
 │    │    │    │    │    ├── parameter_1_cluster_results.csv
 │    │    │    │    │    ├── parameter_2_cluster_results.csv
 │    │    │    │    │    └── ...
 │    │    │    │    │ 
 │    │    │    │    ├── stdbscan/
 │    │    │    │    │ 
 │    │    │    │    └── stkde/
 │    │    │    │    
 │    │    │    ├── feature_combination_2/
 │    │    │    │    
 │    │    │    └── ...
 │    │    │
 │    │    └── 3d/
 │    │          └── ...
 │    │     
 │    └── cluster_plots/ (WIP)
 │          ├── 2d/
 │          │    ├── feature_combination_1/
 │          │    │    ├── proposed_algorithm/
 │          │    │    │    ├── parameter_1_cluster_2d_plot.png
 │          │    │    │    ├── parameter_2_cluster_2d_plot.png
 │          │    │    │    └── ...
 │          │    │    │ 
 │          │    │    ├── stdbscan/
 │          │    │    │ 
 │          │    │    └── stkde/
 │          │    │    
 │          │    ├── feature_combination_2/
 │          │    │    
 │          │    └── ...
 │          │
 │          └── 3d/
 │                ├── feature_combination_1/
 │                │    ├── proposed_algorithm/
 │                │    │    ├── parameter_1_cluster_3d_plot.png
 │                │    │    ├── parameter_2_cluster_3d_plot.png
 │                │    │    └── ...
 │                │    │ 
 │                │    ├── stdbscan/
 │                │    │ 
 │                │    └── stkde/
 │                │    
 │                ├── feature_combination_2/
 │                │    
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
