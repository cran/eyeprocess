## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# ranks <- read.csv(system.file("extdata", "sbc_rank_demo.csv", package = "eyeprocess"))
# sbc <- sbc_rank_diagnostics(ranks$rank, n_draws = unique(ranks$n_draws), bins = 10)
# print(sbc)
# plot(sbc)
# sbc_ecdf_deviation(sbc)

## ----eval=FALSE---------------------------------------------------------------
# analysis_resolution_guard(
#   event_duration_ms = 100,
#   effective_hz = 60,
#   spatial_feature_size = .20,
#   radial_error = .04,
#   min_samples = 3,
#   max_error_fraction = .5
# )

## ----eval=FALSE---------------------------------------------------------------
# pupil <- read.csv(system.file("extdata", "pupil_baseline_demo.csv", package = "eyeprocess"))
# pupil_baseline_sensitivity(
#   pupil,
#   time = "time_ms",
#   pupil = "pupil",
#   by = c("person_id", "trial_id"),
#   windows = list(W500 = c(-500, 0), W300 = c(-300, 0), W200 = c(-200, 0))
# )

