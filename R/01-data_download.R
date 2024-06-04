library(googlesheets4)

raw_data <- read_sheet("https://docs.google.com/spreadsheets/d/1C4MI7v8Fdsk-2DESzuXcFfOcS1Bqu3c7A37WqOHomfk/edit?resourcekey#gid=408969245")

dictionary <- read_sheet("https://docs.google.com/spreadsheets/d/1c9waKTDNWauLYXFbNpiKIXSArJiXTzRn-ppx8J8WDY8/edit#gid=0")

write.csv(raw_data, "data/raw/raw_data.csv")
write.csv(dictionary, "data/processed/dictionary.csv", row.names= FALSE)