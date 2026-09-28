## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
sim <- simulate_multimodal_m4(n_person = 30, n_item = 8, seed = 20260820)
multimodal_m4_ablation(sim)

## ----eval=FALSE---------------------------------------------------------------
# abl <- multimodal_m4_ablation(sim, run = TRUE)
# info <- multimodal_m4_process_information(abl)
# info

