## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)
library(eyeprocess)

## -----------------------------------------------------------------------------
# dash <- bayesian_process_diagnostics_dashboard(
#   response_only = brms_response_model,
#   response_plus_pupil = brms_pupil_model,
#   compute_loo = TRUE,
#   compute_bayes_factor = FALSE
# )
# 
# bayesian_process_diagnostic_flags(dash)
# plot(dash, type = "loo")
# plot(dash, type = "rhat")

## -----------------------------------------------------------------------------
# three_pl <- fit_gaze_anchored_3pl_audit(
#   response_matrix = binary_response_matrix,
#   process_data = binary_long,
#   item = "item_id",
#   process_features = c("ttff_ms", "dwell_ms", "pupil_peak", "rt_ms", "accuracy")
# )
# 
# gaze_anchored_3pl_alignment(three_pl)
# audit_3pl_process_signatures(three_pl)
# plot(three_pl, type = "lower_asymptote")
# plot(three_pl, type = "process_alignment", feature = "ttff_ms")

