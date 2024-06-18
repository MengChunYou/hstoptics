# generate_2d_cluster_results.R

## generate_hst_optics_cluster_results function
generate_hst_optics_cluster_results <- function(
  combination_order,
  parameter_order,
  eps_s,
  eps_t,
  weight_s=1,
  weight_t=1,
  min_pts,
  Xi,
  window_size){
  
  # Read simulated data
  simulated_data <- read_simulated_data(combination_order)
  simulated_data$t <- 0
  
  # Get order and reachability scores
  hst_optics_result = hst_optics(
    simulated_data, 
    eps_s = eps_s, 
    eps_t = eps_t, 
    weight_s = weight_s,
    weight_t = weight_t,
    min_pts = min_pts)
  
  # Get reach score summary when the script is executed directly
  if (length(commandArgs(trailingOnly = TRUE)) == 0) {
    cluster_points_reach_score <- hst_optics_result$reach_score %>% .[is.finite(.)]
    print(cluster_points_reach_score %>% summary())
    print('IQR:')
    print(cluster_points_reach_score %>% IQR())
    print('sd:')
    print(cluster_points_reach_score %>% sd())
  }
  
  # Early return if there is no finite value
  if(all(hst_optics_result$reach_score %in% c(Inf, -Inf))) {
    message("There is no finite value.")
    
    cluster_results <- simulated_data %>% 
      mutate(cluster = 0)
    
    # Write cluster results 
    wirte_cluster_results(
      cluster_results,
      algorithm_name = "proposed_algorithm",
      combination_order = combination_order,
      parameter_order = parameter_order,
      dim = 2)
    
    return()
  }
  
  # Generate reachability plot when the script is executed directly
  generate_reachability_plot = function(hst_optics_result){
    replace(hst_optics_result$reach_score, hst_optics_result$reach_score == Inf, NA) %>% 
      ifelse(is.na(.), max(., na.rm = T) * 1.1, .) %>% 
      plot(., type = "h", ylab = "Reachability scores", xlab = "Order",
           col = ifelse(. == max(.), "lightgray", "black"))
  }
  
  # Identify location of faults based on given parameter Xi and window_size
  find_faults <- function(hst_optics_result, Xi, window_size){
    
    # Initailize
    faults <- rep(0, times = nrow(hst_optics_result))
    smalleast_slope <- Inf
    largest_slope <- -Inf
    best_start_order <- NA
    best_end_order <- NA
    current_up_down <- 0
    nearest_order <- NA
    current_slope <- 0
    slope <- 0
    
    for (ii in 1:nrow(hst_optics_result)) {
      
      # Set up searching window
      window_start <- ii + 1
      window_end <- min(nrow(hst_optics_result), ii + window_size)
      
      # Find nearest order that fit condition
      diffs <- hst_optics_result$reach_score[window_start:window_end] - hst_optics_result$reach_score[ii]
      nearest_order <- (which((diffs < (-Xi)) | (diffs > (Xi))) + ii)[1]
      
      if (is.na(nearest_order)) {
        current_slope <- 0
      } else {
        # update largest_start_order or smalleast_end_order
        current_slope <- diffs[which((diffs < (-Xi)) | (diffs > (Xi)))[1]] / (nearest_order - ii)
      }
      
      if (length(commandArgs(trailingOnly = TRUE)) == 0) {
        # message(paste(ii, nearest_order, largest_slope, best_start_order, smalleast_slope, best_end_order, current_slope, slope, sep = ", "))
      }
      
      if ((is.na(nearest_order)) | (current_slope > 0 & slope < 0) | (current_slope < 0 & slope > 0)) {
        
        # Record previous faults
        if (current_up_down == 1) {
          # If upward trend doesn't continue, record upward fault position
          faults[best_start_order] <- current_up_down
          best_start_order <- NA
          largest_slope = -Inf
        } else if (current_up_down == -1) {
          # If downward trend doesn't continue, record downward fault position
          faults[best_end_order] <- current_up_down
          best_end_order <- NA
          smalleast_slope = Inf
        }
        if (is.na(nearest_order)) {
          # if there is no order fit condition, move to next order
          current_up_down <- 0
          next
        }
      }

      # Renew slope
      slope <- current_slope
      
      if (slope > 0) {
        current_up_down <- 1
        if (slope >= largest_slope) {
          largest_slope <- slope
          best_start_order <- ii
        }
      } else if (slope < 0) {
        current_up_down <- -1
        if (slope <= smalleast_slope) {
          smalleast_slope <- slope
          best_end_order <- nearest_order
        }
      }
    }
    return(faults)
  }
  faults <- find_faults(hst_optics_result, Xi, window_size)
  
  # Plot when the script is executed directly
  if (length(commandArgs(trailingOnly = TRUE)) == 0) {
    generate_reachability_plot(hst_optics_result)
    abline(v = which(faults==1), col = "red")
    abline(v = which(faults==-1), col = "blue")
  }
  
  # Open a PNG device for graphics output
  output_name <- paste(
    "outputs/reachability_plots/2d/",
    "feature_combination_", combination_order,
    "/parameter_", parameter_order,
    "_reachability_plot.png",
    sep = ""
  )
  open_png(output_name)
  
  # Create reachability plot
  generate_reachability_plot(hst_optics_result)
  abline(v = which(faults==1), col = "red")
  abline(v = which(faults==-1), col = "blue")
  
  # Close the PNG device
  dev.off()
  
  message(paste("write", output_name))
  
  # Identify levels for each point
  find_levels <- function(faults, hst_optics_result){
    levels = c(0)
    current_level = 0
    
    for(ii in 2:(length(faults))){
      current_level = current_level + faults[ii]
      
      # Record level for current point
      levels[ii] = current_level
    }
    
    levels = levels - max(levels)
    
    # Replace the level with 0 when the reach_score is Inf
    levels[hst_optics_result$reach_score == Inf] = 0
    
    # Replace the last level with 0
    levels[length(levels)] = 0
    
    # Create a plot when running the script interactively
    if (interactive()) {
      plot(levels, type = "l")
    }
    
    return(levels)
  }
  levels <- find_levels(faults, hst_optics_result)
  
  # Get cluster results 
  find_clusters <- function(levels, hst_optics_result){
    
    n_points <- length(levels)
    deepest_level <- range(levels)[1]
    
    # Initialize a dataframe to record points and their cluster memberships
    point_cluster_membership <- data.frame(
      ordered_id = hst_optics_result$ordered_id[1:n_points]
    )
    point_cluster_membership$cluster <- 0
    
    # for each level 
    n_clusters <- 0
    if(deepest_level != 0){
      for(jj in -1:deepest_level){
        
        # Identify start and end point positions for each cluster
        cluster_positions = ((cut(x = 1:n_points, breaks = which(levels > jj)) %>% table)>1 ) %>%
          which %>% names %>% gsub("\\(", "", .) %>% gsub("\\]", "", .) %>%
          strsplit(., split = ",") %>% 
          lapply(function(x) {x = as.numeric(x) + c(1, -1)})
        
        # for each cluster in current level
        for(ii in 1:length(cluster_positions)){
          
          # Identify whether each point belongs to a cluster ii
          in_cluster_ii <- c(1:n_points) %in% (cluster_positions[[ii]][1]:cluster_positions[[ii]][2])
          
          # Concatenate membership into dataframe
          point_cluster_membership = cbind(
            point_cluster_membership, 
            ifelse(in_cluster_ii, 1, 0))
          
          # Rename columns
          n_clusters <- n_clusters + 1
          col_name <- paste("cluster", n_clusters, sep = "")
          colnames(point_cluster_membership)[ncol(point_cluster_membership)] <- 
            col_name
          
          # Record the highest density cluster to which each point belongs
          point_cluster_membership$cluster[in_cluster_ii] <- n_clusters
        }
      }
    }
    
    
    # join cluster results into simulated data
    cluster_results <- simulated_data %>% 
      mutate(id = 1:nrow(.)) %>% 
      left_join(point_cluster_membership, by = c("id" = "ordered_id")) %>%
      subset(select = -id )
    
    # Create a 2D plot when the script is executed directly
    if (length(commandArgs(trailingOnly = TRUE)) == 0) {
      plot_cluster_results_2d(simulated_data, cluster_results)
    }
    
    return(cluster_results)
  }
  cluster_results <- find_clusters(levels, hst_optics_result)
  
  # Write cluster results 
  wirte_cluster_results(
    cluster_results,
    algorithm_name = "proposed_algorithm",
    combination_order = combination_order,
    parameter_order = 1,
    dim = 2)
}

## generate cluster results

### feature_combination_1
generate_hst_optics_cluster_results(
  combination_order = 1,
  parameter_order = 1,
  eps_s = 1.5,
  eps_t = 1.5,
  weight_s = 1,
  weight_t = 1,
  min_pts = 100,
  Xi = 0.4,
  window_size = 500
)

### feature_combination_2
generate_hst_optics_cluster_results(
  combination_order = 2,
  parameter_order = 1,
  eps_s = 1.5,
  eps_t = 1.5,
  weight_s = 1,
  weight_t = 1,
  min_pts = 100,
  Xi = 0.4,
  window_size = 500
)

### feature_combination_3
generate_hst_optics_cluster_results(
  combination_order = 3,
  parameter_order = 1,
  eps_s = 1.5,
  eps_t = 1.5,
  weight_s = 1,
  weight_t = 1,
  min_pts = 100,
  Xi = 0.4,
  window_size = 500
)

### feature_combination_4
generate_hst_optics_cluster_results(
  combination_order = 4,
  parameter_order = 1,
  eps_s = 1.5,
  eps_t = 1.5,
  weight_s = 1,
  weight_t = 1,
  min_pts = 100,
  Xi = 0.3,
  window_size = 500
)

### feature_combination_5
generate_hst_optics_cluster_results(
  combination_order = 5,
  parameter_order = 1,
  eps_s = 1.5,
  eps_t = 1.5,
  weight_s = 1,
  weight_t = 1,
  min_pts = 100,
  Xi = 0.4,
  window_size = 500
)

### feature_combination_6
generate_hst_optics_cluster_results(
  combination_order = 6,
  parameter_order = 1,
  eps_s = 1.5,
  eps_t = 1.5,
  weight_s = 1,
  weight_t = 1,
  min_pts = 100,
  Xi = 0.24,
  window_size = 800
)

### feature_combination_7
generate_hst_optics_cluster_results(
  combination_order = 7,
  parameter_order = 1,
  eps_s = 1.5,
  eps_t = 1.5,
  weight_s = 1,
  weight_t = 1,
  min_pts = 100,
  Xi = 0.26,
  window_size = 410
)
