library(dplyr)
library(readr)
raw_data <- read.csv("data/raw/raw_data.csv")
processed_data <- raw_data |>
  rename(position = Why.are.you.working.in.this.lab.) |>
  mutate(position = recode(position,
                              "Mater's Thesis" = "Master's Thesis")) |>
  rename(pair_of_gloves = How.many.pairs.of.GLOVES.did.you.use.in.your.experiment.) |>
  rename(gender = Gender) |>
  rename(ser_pipettes_5ml = How.many.5.ml.SEROLOGICAL.PIPETTES.did.you.use.in.your.experiment.) |>
  rename(ser_pipettes_10ml = How.many.10.ml.SEROLOGICAL.PIPETTES.did.you.use.in.your.experiment.) |>
  rename(ser_pipettes_25ml = How.many.25.ml.SEROLOGICAL.PIPETTES.did.you.use.in.your.experiment.) |>
  rename(ser_pipettes_50ml = How.many.50.ml.SEROLOGICAL.PIPETTES.did.you.use.in.your.experiment.) |>
  rename(pipette_tips = How.many.PIPETTE.TIPS.did.you.use.in.your.experiment...no.matter.the.size.) |>
  rename(glass_tips = How.many.ASPIRATOR.GLASS.TIPS.did.you.use.in.your.experiment.) |>
  rename(flasks = How.many.FLASKS.did.you.throw.away.in.your.experiment...no.matter.the.size.) |>
  rename(falcon_tubes = How.many.FALCON.TUBES.did.you.throw.away.in.your.experiment..no.matter.the.size.) |>
  rename(eppi_tubes = How.many.EPPENDORF.TUBES.did.you.throw.away.in.your.experiment...no.matter.the.size.) |>
  rename(support_opinion = Do.you.feel.that.your.lab.receives.adequate.support.and.resources.to.address.single.use.waste.management.effectively.)


processed_data <- processed_data |>
  select(gender, position, pair_of_gloves, ser_pipettes_5ml, ser_pipettes_10ml, ser_pipettes_25ml, ser_pipettes_50ml, pipette_tips, glass_tips, flasks, falcon_tubes, eppi_tubes, support_opinion)

glimpse(proc)

write_csv(processed_data, "data/processed/processed_data.csv")
