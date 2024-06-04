# Load the necessary libraries
library(dplyr)
library(tidyr)

# Load the processed data
processed_data <- read.csv("data/processed/processed_data.csv")

# Restructure the data
tidy_data <- processed_data |>
  mutate(id = row_number()) |>
  pivot_longer(
    cols = c(pair_of_gloves, ser_pipettes_5ml, ser_pipettes_10ml, ser_pipettes_25ml, 
             ser_pipettes_50ml, pipette_tips, glass_tips, flasks, falcon_tubes, eppi_tubes),
    names_to = "tool_used",
    values_to = "quantity"
  ) |>
  mutate(
    material = case_when(
      tool_used %in% c("pair_of_gloves") ~ "latex",
      tool_used %in% c("ser_pipettes_5ml", "ser_pipettes_10ml", "ser_pipettes_25ml", "ser_pipettes_50ml", "glass_tips" ) ~ "glass",
      tool_used %in% c("falcon_tubes", "eppi_tubes") ~ "polypropylene",
      tool_used %in% c("flasks") ~ "polystyrene",
      tool_used %in% c("pipette_tips") ~ "polyethylene"
    ),
    volume = case_when(
      tool_used == "ser_pipettes_5ml" ~ 5,
      tool_used == "ser_pipettes_10ml" ~ 10,
      tool_used == "ser_pipettes_25ml" ~ 25,
      tool_used == "ser_pipettes_50ml" ~ 50,
      tool_used == "pair_of_gloves" ~ 17,
      tool_used == "pipette_tips" ~ 1,
      tool_used == "glass_tips" ~ 3,
      tool_used == "flasks" ~ 40,
      tool_used == "falcon_tubes" ~ 30,
      tool_used == "eppi_tubes" ~ 2
    )
  ) |>
  select(id, gender, position, support_opinion, experiment_type, tool_used, material, quantity, volume)

tidy_data <- tidy_data |>
  mutate(
    tool_used = case_when(
      tool_used == "eppi_tubes" ~ "Eppendorf Tubes",
      tool_used == "falcon_tubes" ~ "Falcon Tubes",
      tool_used == "pipette_tips" ~ "Pipette Tips",
      tool_used == "glass_tips" ~ "Glass Tips",
      tool_used == "flasks" ~ "Flasks",
      tool_used == "pair_of_gloves" ~ "Pairs of Gloves",
      tool_used == "ser_pipettes_5ml" ~ "Serological Pipettes (5ml)",
      tool_used == "ser_pipettes_10ml" ~ "Serological Pipettes (10ml)",
      tool_used == "ser_pipettes_25ml" ~ "Serological Pipettes (25ml)",
      tool_used == "ser_pipettes_50ml" ~ "Serological Pipettes (50ml)"
    )
  )

tidy_data <- tidy_data |>
  mutate(total_volume = quantity * volume)

# Save the new data
write.csv(tidy_data, "data/processed/tidy_data.csv")
write_rds(tidy_data, "data/processed/tidy_data.rds")