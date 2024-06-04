# Load the necessary libraries
library(dplyr)
library(tidyr)

processed_data <- read.csv("data/processed/processed_data.csv")

# Calculate the summary statistics
survey_metrics <- processed_data |>
  summarize(
    num_respondents = n(),
    gender_pct = paste0(
      round(sum(gender == "Woman") / num_respondents * 100, 2), "% Women, ",
      round(sum(gender == "Man") / num_respondents * 100, 2), "% Men"
    ),
    support_opinion_pct = paste0(
      round(sum(support_opinion == "Yes") / num_respondents * 100, 2), "% Yes, ",
      round(sum(support_opinion == "Maybe") / num_respondents * 100, 2), "% Maybe"
    ),
    position_pct = paste0(
      round(sum(position == "Post-doc") / num_respondents * 100, 2), "% Post-doc, ",
      round(sum(position == "Doctorate") / num_respondents * 100, 2), "% Doctorate, ",
      round(sum(position %in% c("Master's Thesis", "Master's Semester Project")) / num_respondents * 100, 2), "% Master, ",
      round(sum(position == "Bachelor's Thesis") / num_respondents * 100, 2), "% Bachelor"
    )
  )

# Save the new data
write.csv(survey_metrics, "data/final/survey_metrics.csv")
write_rds(survey_metrics, "data/final/survey_metrics.rds")