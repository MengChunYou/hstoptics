# generate_cluster_result.R

# Read simulated data
simulated_data <- read.csv(
  paste(
    "data/simulated/feature_combination_6.csv", 
    sep = ""))

# Get order and reachability scores
hst_optics_result <- hst_optics(
  xyt_df=simulated_data, 
  xyt_colname=c("x", "y", "t"),
  eps_s = 10,
  eps_t = 10,
  min_pts = 180)

# Generate Reachability Plot
generate_reachability_plot = function(hst_optics_result){
  replace(hst_optics_result$reach_score, hst_optics_result$reach_score == Inf, NA) %>% 
    ifelse(is.na(.), max(., na.rm = T) * 1.1, .) %>% 
    plot(., type = "h", ylab = "Reachability scores", xlab = "Order",
         col = ifelse(. == max(.), "lightgray", "black"))
}
generate_reachability_plot(hst_optics_result)

# Identify points located at faults

## Calculate steepness
cal_reach_score_diff <- function(hst_optics_result){
  diff <- hst_optics_result$reach_score[2:nrow(hst_optics_result)] - 
    hst_optics_result$reach_score[1:(nrow(hst_optics_result)-1)]
  return(diff)
}
steepness <- hst_optics_result %>% cal_reach_score_diff()

# ## Identify location of faults based on given parameter Xi
# find_faults <- function(steepness, Xi){
#   move <- rep(0, times = length(steepness))
#   move[which(steepness < (-Xi))] <- -1
#   move[which(steepness>(Xi))] <- 1
#   return(move)
# }
# faults <- find_faults(steepness, 0.2)

# my_level = c(0)
# my_sum = 0
# for(ii in 1:(nrow(hst_optics_result)-1)){
#   my_sum = my_sum + faults[ii]
#   if(hst_optics_result$reach_score[ii+1]==Inf){
#     my_sum = 0
#   }
#   my_level[ii+1] = my_sum
# }
# my_level[length(my_level)] = 0 ######################################################################
# 
# g_level = c()
# df = data.frame(ID = hst_optics_result$ordered_id[1:length(my_level)])
# for(jj in (-1:(range(my_level)[1]))){ 
#   print(jj)
#   my_list = ((cut(x = 1:length(my_level), breaks = which(my_level > jj), ) %>% table)>1 ) %>% 
#     which %>% names %>% gsub("\\(", "", .) %>% gsub("\\]", "", .) %>%
#     strsplit(., split = ",")
#   for(ii in 1:length(my_list)){
#     print(paste("  ", ii))
#     g_level = c(g_level, jj)
#     df = cbind(df, ifelse(c(1:length(my_level)) %in% (as.numeric(my_list[[ii]][1])+1):(as.numeric(my_list[[ii]][2])-1), 1, 0))
#   }
# }
# colnames(df) = c("ordered_id", paste("g", 1:(ncol(df)-1), sep = ""))
# 
# simulated_data = cbind(simulated_data, df[order(df$ordered_id),-1])
