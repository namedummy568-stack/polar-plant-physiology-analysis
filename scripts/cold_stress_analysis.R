
# R script for plant data analysis

# Load necessary libraries
# library(ggplot2)
# library(dplyr)

# Function to load data
load_plant_data <- function(file_path) {
  data <- read.csv(file_path)
  return(data)
}

# Basic data summary function
summarize_data <- function(data) {
  summary_stats <- summary(data)
  return(summary_stats)
}

# New function for min-max normalization
normalize_data_cold_stress <- function(data) {
  # Assuming 'data' is a data frame and we want to normalize numerical columns
  normalized_data <- as.data.frame(lapply(data, function(x) {
    if (is.numeric(x)) {
      min_val <- min(x, na.rm = TRUE)
      max_val <- max(x, na.rm = TRUE)
      if (max_val == min_val) { # Avoid division by zero
        return(rep(0, length(x)))
      } else {
        return((x - min_val) / (max_val - min_val))
      }
    } else {
      return(x)
    }
  }))
  return(normalized_data)
}

# Main analysis function
run_analysis <- function(file_path) {
  plant_data <- load_plant_data(file_path)
  summary_results <- summarize_data(plant_data)
  print("Data Summary:")
  print(summary_results)
  
  # Example of using the new normalization function
  # normalized_plant_data <- normalize_data_cold_stress(plant_data)
  # print("Normalized Data (first 5 rows):")
  # print(head(normalized_plant_data, 5))
  
  return(summary_results)
}

# Example usage:
# file_path <- "path/to/your/plant_data.csv"
# analysis_results <- run_analysis(file_path)
