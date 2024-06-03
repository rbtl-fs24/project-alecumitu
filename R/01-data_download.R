library(googlesheets4)

raw_data <- read_sheet("https://docs.google.com/spreadsheets/d/1C4MI7v8Fdsk-2DESzuXcFfOcS1Bqu3c7A37WqOHomfk/edit?resourcekey#gid=408969245")

write.csv(raw_data, "data/raw/raw_data.csv")