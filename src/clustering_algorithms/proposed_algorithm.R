# proposed_algorithm.R

# mst_optics
mst_optics <- function(
  xyt_df, 
  xyt_colname=c("x", "y", "t"),
  eps_s, 
  eps_t, 
  weight_s=1,
  weight_t=1,
  min_pts) {
  
  # This function orders spatio-temporal points to identify the clustering structure
  #
  # Args:
  #   xyt_df: A data frame containing spatio-temporal points
  #   xyt_colname: A vector which contains names of columns holding longitude, latitude, and time
  #   eps_s: Size (radius) of the spatial epsilon neighborhood
  #   eps_t: Size (radius) of the temporal epsilon neighborhood
  #   weight_s: Weight of spatial distance
  #   weight_t: Weight of time distance
  #   min_pts: Number of minimum points required in the eps_s and eps_t 
  #            neighborhood for core points (including the point itself).
  #
  # Returns:
  #   A data frame containing order and reachability scores of points
  
  # Create a copy of the data frame
  xyt_df_copy <- xyt_df
  
  # Setup unique id for event point
  xyt_df_copy <- xyt_df_copy %>% mutate(id = 1:nrow(.), .before = xyt_colname[1])
  
  # Space for recording order & reachability scores & points to be visited
  ordered_id <- c()
  reach_score <- c()
  points_to_be_visited <- slice(xyt_df_copy, 0)
  
  # A function calculate distance from a specific point to other points
  get_distance_to <- function(one_point, other_points) {
    sq_dist <- (one_point[1, xyt_colname[1]] - other_points[, xyt_colname[1]])^2 + 
      (one_point[1, xyt_colname[2]] - other_points[, xyt_colname[2]])^2
    return(sqrt(sq_dist))
  }
  
  # A function calculate spatio-temporal distance from a specific point to other points
  get_st_distance_to <- function(one_point, other_points, weight_s=1, weight_t=1) {
    s_dist <- get_distance_to(one_point, other_points)
    t_dist <- one_point[1, xyt_colname[3]] - other_points[, xyt_colname[3]]
    sq_st_dist <- (weight_s * s_dist)^2 + (weight_t * t_dist)^2
    return(sqrt(sq_st_dist))
  }
  
  for(iter in 1:nrow(xyt_df_copy)){  
    
    # Visit each point one by one
    if (length(commandArgs(trailingOnly = TRUE)) == 0) {
      message(paste(iter, "/", nrow(xyt_df_copy), sep = ""))
    }
    
    if(nrow(points_to_be_visited) == 0){
      
      # If there is no point to be visited
      # Continue with the point at the very beginning of the unvisited points
      visited_id <- setdiff(xyt_df_copy$id, ordered_id)[1]
      
      # Record reachability score
      reach_score <- reach_score %>% append(Inf)
      
    }else{
      
      # If there are any points to be visited
      # Continue with the point with the smallest reachability distance
      visited_id <- 
        points_to_be_visited$id[which.min(points_to_be_visited$reach_dist)]
      
      # Record reachability score
      reach_score <- reach_score %>% 
        append(min(points_to_be_visited$reach_dist))
      
    }
    
    # Record order
    ordered_id <- ordered_id %>% append(visited_id)
    
    # Find temporal neighbor points
    t_nbs <- xyt_df_copy %>% 
      filter(get(xyt_colname[3]) <= (.[visited_id, xyt_colname[3]] + eps_t)) %>% 
      filter(get(xyt_colname[3]) >= (.[visited_id, xyt_colname[3]] - eps_t))
    
    # Find spatio-temporal neighbor points
    st_nbs <- t_nbs %>% 
      mutate(dist = get_distance_to(xyt_df_copy[visited_id, ], .)) %>% 
      filter(dist <= eps_s)
    
    if(nrow(st_nbs) >= min_pts){
      
      # If visited point is core point
      # Calculate core distance
      st_nbs <- st_nbs %>% 
        mutate(st_dist = get_st_distance_to(xyt_df_copy[visited_id, ], ., weight_s=1, weight_t=1))
      core_dist <- st_nbs$st_dist %>% sort() %>% .[min_pts]
      
      # Calculate reachability distance
      st_nbs <- st_nbs %>%
        rename(reach_dist = st_dist) %>% 
        mutate(reach_dist = ifelse(reach_dist < core_dist, 
                                   core_dist, 
                                   reach_dist))
      
      # Renew points to be visited
      # Keep rows with unique IDs, 
      # preferring the one with the smaller reachability distance.
      points_to_be_visited <- points_to_be_visited %>% 
        bind_rows(st_nbs) %>%
        arrange(reach_dist) %>%
        distinct(id, .keep_all = TRUE)
      
    }
    # Remove visited point from points to be visited
    points_to_be_visited <- points_to_be_visited %>%
      filter(!(id %in% ordered_id))
  }
  
  return(data.frame(ordered_id = ordered_id, 
                    reach_score = reach_score))
  
}
