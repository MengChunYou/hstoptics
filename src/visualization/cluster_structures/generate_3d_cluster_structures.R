# generate_3d_cluster_structures.R

dim <- 3

for (combination_order in 1:7) {
  
  # Get parameter orders
  cluster_results_dir <- list.files(paste(
    'outputs/clustering_results/',
    dim, 'd/',
    'feature_combination_', combination_order, 
    '/proposed_algorithm',
    sep = ''
  ))
  parameter_orders <- as.numeric(gsub("[^0-9]", "", cluster_results_dir))
  
  for (parameter_order in parameter_orders) {
    # Write edge list
    write_edge_list(
      combination_order = combination_order, 
      parameter_order = parameter_order, 
      dim = dim
    )
    # Write tree diagram
    write_tree_diagram(
      combination_order = combination_order, 
      parameter_order = parameter_order, 
      dim = dim
    )
  }
}