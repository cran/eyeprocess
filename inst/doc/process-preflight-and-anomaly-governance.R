## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)
library(eyeprocess)

## -----------------------------------------------------------------------------
# spec <- process_preflight_spec(
#   min_gaze_validity = 0.80,
#   min_pupil_validity = 0.70,
#   max_gaze_missingness = 0.25,
#   max_pupil_missingness = 0.30,
#   min_valid_trial_fraction = 0.70
# )
# 
# audit <- audit_biometric_preflight(
#   trial_data,
#   by = c("person_id", "recording_id"),
#   spec = spec
# )
# 
# preflight_decisions(audit)
# preflight_failures(audit)
# preflight_exclusion_manifest(audit)
# plot(audit, type = "heatmap")
# plot(audit, type = "decision_counts")

## -----------------------------------------------------------------------------
# anomaly <- audit_process_anomalies(
#   person_process_data,
#   person = "person_id",
#   metrics = c("rt_ms", "dwell_ms", "pupil_peak", "valid_gaze_prop")
# )
# 
# process_anomaly_distance(anomaly)
# plot(anomaly)

