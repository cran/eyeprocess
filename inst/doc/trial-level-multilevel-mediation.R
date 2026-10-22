## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# prepared <- prepare_multilevel_mediation_data(
#   trials,
#   x_col = "ai_correct",
#   mediator_col = "source_dwell",
#   outcome_col = "correct_override",
#   quality_col = "valid_fraction",
#   minimum_quality = 0.80,
#   quality_action = "flag"
# )

## ----eval=FALSE---------------------------------------------------------------
# prepared <- add_multilevel_mediation_component(
#   prepared,
#   value_col = "trust",
#   semantic = "mediator2",
#   within_col = "M2_within",
#   between_col = "M2_between"
# )

