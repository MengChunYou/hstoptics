# spatio-temporal-cluster-fault-identification

## Repository Structure

```plaintext
root/
 ├── data/
 │    ├── simulated/
 │    │    ├── feature_combination_1.csv
 │    │    ├── feature_combination_2.csv
 │    │    └── ...
 │    └── empirical/
 │         ├── raw/
 │         ├── accidents/
 │         │    ├── holidays_2022.csv
 │         │    ├── taiwan_village_polygons/
 │         │    └── traffic_network/             
 │         └── processed/
 │              ├── filtered_accidents.csv
 │              ├── study_area_polygons/
 │              └── study_area_network/            
 │
 ├── src/
 │    ├── simulation.R
 │    ├── data_processings.R
 │    ├── clustering_algorithms/
 │    │    ├── proposed_algorithm.R
 │    │    ├── stkde.R
 │    │    ├── tnkde.R                      
 │    │    └── stdbscan.R
 │    │ 
 │    ├── descriptive_statistics/
 │    │    ├── simulated_data/
 │    │    │    └── generate_3d_plots.R
 │    │    │
 │    │    └── empirical_data/
 │    │         └── filtered_data_visualization.R
 │    │
 │    ├── clustering/
 │    │    ├── simulated_data/
 │    │    │    └── proposed_algorithm/
 │    │    │         ├── generate_cluster_results.R
 │    │    │         └── generate_cluster_3d_plot.R
 │    │    │
 │    │    └── empirical_data/
 │    │         ├── proposed_algorithm/
 │    │         │    ├── generate_cluster_results.R
 │    │         │    └── generate_cluster_animation.R
 │    │         │
 │    │         ├── stkde/
 │    │         │    └── ...
 │    │         │
 │    │         ├── tnkde/                   
 │    │         │    └── ...
 │    │         │
 │    │         └── stdbscan/
 │    │              └── ...
 │    │
 │    └── sensitivity_analysis.R
 │         └── empirical_data/
 │              └── proposed_algorithm/
 │                   ├── generate_cluster_results.R
 │                   └── generate_cluster_animation.R
 │
 ├── output/
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
 │    │              └── filtered_accidents_timeseries.png
 │    │
 │    ├── clustering_results/
 │    │    ├── simulated_data/
 │    │    │    └── proposed_algorithm/
 │    │    │         ├── cluster_results/
 │    │    │         │    ├── feature_combination_1_cluster_results.csv
 │    │    │         │    ├── feature_combination_2_cluster_results.csv
 │    │    │         │    └── ...
 │    │    │         │
 │    │    │         └── cluster_3d_plot/
 │    │    │              ├── feature_combination_1_cluster_3d_plot.png
 │    │    │              ├── feature_combination_2_cluster_3d_plot.png
 │    │    │              └── ...
 │    │    │   
 │    │    └── empirical_data/
 │    │         ├── proposed_algorithm/
 │    │         │    ├── cluster_results.csv
 │    │         │    └── cluster_animation.gif
 │    │         │
 │    │         ├── stkde/
 │    │         │    └── ...
 │    │         │
 │    │         ├── tnkde/                   
 │    │         │    └── ...
 │    │         │
 │    │         └── stdbscan/
 │    │              └── ...
 │    │
 │    └── sensitivity_analysis/
 │         └── empirical_data/
 │              └── proposed_algorithm/
 │                   ├── cluster_results.csv
 │                   └── cluster_animation/
 │                        ├── parameter_1.gif
 │                        ├── parameter_2.gif
 │                        └── ...
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
