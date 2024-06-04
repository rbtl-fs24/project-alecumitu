library(dplyr)
library(readr)
raw_data <- read.csv("data/raw/raw_data.csv")
processed_data <- raw_data |>
  rename(position = Why.are.you.working.in.this.lab.) |>
  mutate(position = recode(position,
                              "Mater's Thesis" = "Master's Thesis")) |>
  rename(pair_of_gloves = How.many.pairs.of.GLOVES.did.you.use.in.your.experiment.) |>
  rename(gender = Gender) |>
  rename(experiment_type = What.kind.of.experiment.did.you.do.) |>
  mutate(experiment_type = recode(experiment_type,
                                  "New experiment (i.e. a completely new trial in the context of your research)" = "New experiment",
                                  "Follow-up experiment (i.e. a direct continuation of a previous new experiments)" = "Follow-up experiment",
                                  "Routine experiment (e.g. long-term media change or cell splitting)" = "Routine experiment")) |>
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
  select(gender, position, experiment_type, pair_of_gloves, ser_pipettes_5ml, ser_pipettes_10ml, ser_pipettes_25ml, ser_pipettes_50ml, pipette_tips, glass_tips, flasks, falcon_tubes, eppi_tubes, support_opinion)

glimpse(processed_data)

write_csv(processed_data, "data/processed/processed_data.csv")
write_rds(processed_data, "data/processed/processed_data.rds")
