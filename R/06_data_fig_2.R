library(dplyr)

tidy_data <- read_csv("data/processed/tidy_data.csv")

grouped_bar_plot <- tidy_data |>
  group_by(material, experiment_type) |>
  summarise(total_volume = sum(total_volume))

# Save the new data
write.csv(grouped_bar_plot, "data/final/grouped_bar_plot.csv")
write_rds(grouped_bar_plot, "data/final/grouped_bar_plot.rds")