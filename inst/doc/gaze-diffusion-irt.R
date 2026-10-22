## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# spec <- gaze_diffusion_spec(
#   response = "score",
#   response_time = "response_time",
#   drift_features = c("evidence_dwell_balance", "verification_transitions"),
#   boundary_features = "warning_dwell",
#   nondecision_features = "first_fixation_latency",
#   starting_features = "initial_option_bias",
#   censor_column = "rt_censoring",
#   contaminant = TRUE,
#   engine = "stan"
# )
# 
# prepared <- prepare_gaze_diffusion_data(trials, spec)
# fit <- fit_gaze_diffusion_irt(trials, spec, seed = 42)

## ----eval=FALSE---------------------------------------------------------------
# extract_diffusion_parameters(fit)
# diffusion_parameter_diagnostics(fit, correlation_threshold = 0.85)
# diffusion_posterior_predictive(fit)
# compare_diffusion_accuracy_rt(fit)

## ----eval=FALSE---------------------------------------------------------------
# programme <- diffusion_identification_study(
#   conditions = list(
#     n_person = c(50L, 150L, 500L),
#     n_item = c(10L, 30L),
#     gaze_effect = c(0, 0.20, 0.40),
#     contaminant_fraction = c(0, 0.05)
#   ),
#   replications = 200L
# )

