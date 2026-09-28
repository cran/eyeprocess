## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m3(
  n_person = 80,
  n_item = 10,
  pupil_missingness = "device",
  seed = 20260815
)

audit <- audit_multimodal_m3_identifiability(sim)
audit$device

## ----fig.width=7, fig.height=4------------------------------------------------
plot(sim, type = "device")
plot(audit, type = "device")

## -----------------------------------------------------------------------------
neg <- multimodal_m3_negative_controls(sim, seed = 20260816)
neg$provenance

## ----fig.width=8, fig.height=5------------------------------------------------
plot(neg, type = "pupil_alignment")

## ----eval=FALSE---------------------------------------------------------------
# ab <- multimodal_m3_ablation(sim, chains = 4, parallel_chains = 4)
# info <- multimodal_m3_process_information(ab, pupil_cost = 1.5)
# info$sensor_value
# plot(info, type = "sensor_value")

