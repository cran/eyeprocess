## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# spec <- theory_strategy_spec(
#   strategies = list(
#     analytic = c(prompt_dwell = 1, evidence_dwell = 1, option_switches = 0.5),
#     heuristic = c(prompt_dwell = -0.5, evidence_dwell = -0.8, option_switches = -0.2)
#   ),
#   response = "score",
#   participant = "participant_id",
#   item = "item_id",
#   condition = "condition",
#   item_availability = availability,
#   engine = "stan",
#   anchor_strength = 3
# )
# 
# fit <- fit_theory_strategy_irt(trials, spec, seed = 42)

## ----eval=FALSE---------------------------------------------------------------
# probability <- strategy_posterior_probabilities(fit)
# strategy_classification_uncertainty(fit, threshold = 0.70)
# strategy_label_switching_diagnostics(fit)

## ----eval=FALSE---------------------------------------------------------------
# sensitivity <- strategy_aoi_sensitivity(
#   list(primary_aoi = trials_primary, expanded_aoi = trials_expanded),
#   spec,
#   seed = 42
# )
# plot(sensitivity)
# compare_strategy_heterogeneity(fit)

