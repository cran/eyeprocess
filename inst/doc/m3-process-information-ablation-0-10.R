## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
eyeprocess:::.ep10_m3_ablation_definitions()

## ----eval=FALSE---------------------------------------------------------------
# sim <- simulate_multimodal_m3(n_person = 100, n_item = 12, seed = 20260815)
# 
# ab <- multimodal_m3_ablation(
#   sim,
#   chains = 4,
#   parallel_chains = 4,
#   iter_warmup = 750,
#   iter_sampling = 750,
#   refresh = 0
# )
# 
# info <- multimodal_m3_process_information(ab)
# print(info)

## ----eval=FALSE---------------------------------------------------------------
# info$incremental_pupil
# plot(info, type = "incremental_pupil")

## ----eval=FALSE---------------------------------------------------------------
# info$nonadditivity
# plot(info, type = "redundancy")

## ----eval=FALSE---------------------------------------------------------------
# info$sensor_value
# info$channel_conflict
# plot(info, type = "sensor_value")
# plot(info, type = "conflict")

