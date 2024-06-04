# Load the necessary libraries
library(dplyr)
library(tidyr)

tidy_data <- read_csv("data/processed/tidy_data.csv")

tools <- tidy_data |>
  group_by(tool_used) |>
  summarise(
    count = sum(quantity),
    mean = round(mean(quantity), 1),
    median = round(median(quantity), 1),
    sd = round(sd(quantity), 1)
  )

# Save the new data
write.csv(tools, "data/final/tools.csv")
write_rds(tools, "data/final/tools.rds")