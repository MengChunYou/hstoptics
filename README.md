# spatio-temporal-cluster-fault-identification

## Repository Structure

```plaintext
root/
 ├── data/
 │    ├── simulated/ (WIP)
 │    │    ├── feature_combination_1.csv
 │    │    ├── feature_combination_2.csv
 │    │    └── ...
 │    └── empirical/
 │         ├── raw/
 │         │    ├── taiwan_village_polygons/
 │         │    ├── traffic_network/ (WIP)
 │         │    ├── accidents/
 │         │    └── holidays_2022.csv
 │         └── processed/
 │              ├── study_area_polygons.RData
 │              ├── study_area_network.RData (WIP)
 │              └── filtered_accidents_points.RData
 │
 ├── src/
 │    ├── common_functions.R
 │    ├── simulation.R (WIP)
 │    ├── data_processing.R
 │    ├── descriptive_statistics/
 │    │    ├── simulated_data/
 │    │    │    └── generate_3d_plots.R
 │    │    │
 │    │    └── empirical_data/
 │    │         └── filtered_data_visualization.R
 │    │ 
 │    ├── clustering_algorithms/ (WIP)
 │    │    ├── proposed_algorithm.R
 │    │    ├── stkde.R
 │    │    ├── tnkde.R                      
 │    │    └── stdbscan.R
 │    │
 │    └── performing_clustering/ (WIP)
 │         ├── simulated_data/
 │         │    ├── proposed_algorithm/
 │         │    │    ├── generate_cluster_results.R
 │         │    │    └── generate_cluster_animation.R
 │         │    │
 │         │    ├── stkde/
 │         │    │
 │         │    ├── tnkde/                   
 │         │    │
 │         │    └── stdbscan/
 │         │
 │         └── empirical_data/
 │              ├── proposed_algorithm/
 │              │    ├── generate_cluster_results.R
 │              │    └── generate_cluster_animation.R
 │              │
 │              ├── stkde/
 │              │
 │              ├── tnkde/                   
 │              │
 │              └── stdbscan/
 │     
 ├── outputs/
 │    ├── descriptive_statistics/
 │    │    ├── simulated_data/
 │    │    │    └── 3d_plot/
 │    │    │         ├── feature_combination_1_3d_plot.png
 │    │    │         ├── feature_combination_2_3d_plot.png
 │    │    │         └── ...
 │    │    │
 │    │    └── empirical_data/
 │    │         └── processed/
 │    │              ├── filtered_accidents_map.png
 │    │              └── filtered_accidents_time_series.png
 │    │
 │    ├── cluster_results/ (WIP)
 │    │    ├── simulated_data/
 │    │    │    ├── feature_combination_1/
 │    │    │    │    ├── proposed_algorithm/
 │    │    │    │    │    ├── parameter_1_cluster_results.csv
 │    │    │    │    │    ├── parameter_2_cluster_results.csv
 │    │    │    │    │    └── ...
 │    │    │    │    │ 
 │    │    │    │    ├── stkde/
 │    │    │    │    │ 
 │    │    │    │    ├── tnkde/
 │    │    │    │    │ 
 │    │    │    │    └──stdbscan/
 │    │    │    │    
 │    │    │    ├── feature_combination_2/
 │    │    │    │    
 │    │    │    └── ...
 │    │    │
 │    │    └── empirical_data/
 │    │         ├── proposed_algorithm/
 │    │         │    ├── parameter_1_cluster_results.csv
 │    │         │    ├── parameter_2_cluster_results.csv
 │    │         │    └── ...
 │    │         │ 
 │    │         ├── stkde/
 │    │         │ 
 │    │         ├── tnkde/
 │    │         │ 
 │    │         └── stdbscan/
 │    │     
 │    └── cluster_plots/ (WIP)
 │         ├── simulated_data/
 │         │    ├── feature_combination_1/
 │         │    │    ├── proposed_algorithm/
 │         │    │    │    ├── parameter_1_cluster_3d_plot.png
 │         │    │    │    ├── parameter_2_cluster_3d_plot.png
 │         │    │    │    └── ...
 │         │    │    │ 
 │         │    │    ├── stkde/
 │         │    │    │ 
 │         │    │    ├── tnkde/
 │         │    │    │ 
 │         │    │    └──stdbscan/
 │         │    │    
 │         │    ├── feature_combination_2/
 │         │    │    
 │         │    └── ...
 │         │
 │         └── empirical_data/
 │              ├── proposed_algorithm/
 │              │    ├── parameter_1_cluster_animation.gif
 │              │    ├── parameter_2_cluster_animation.gif
 │              │    └── ...
 │              │ 
 │              ├── stkde/
 │              │ 
 │              ├── tnkde/
 │              │ 
 │              └── stdbscan/
 │
 ├── reports/
 │    ├── report.pdf
 │    └── presentation.pdf
 │
 ├── main_script.R
 ├── README.md
 ├── requirements.txt
 └── .gitignore
```
