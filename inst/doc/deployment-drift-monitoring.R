## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)
library(eyeprocess)

## -----------------------------------------------------------------------------
# spec <- process_drift_spec(
#   baseline = "first_batch",
#   difficulty_limit = 0.40,
#   gaze_validity_drop = 0.10,
#   luminance_limit = 25
# )
# 
# drift <- audit_process_drift(
#   deployment_monitor,
#   item = "item_id",
#   batch = "deployment_batch",
#   metrics = c(
#     "irt_difficulty", "irt_discrimination", "rt_ms", "dwell_ms",
#     "pupil_bc", "valid_gaze_prop", "screen_luminance"
#   ),
#   spec = spec
# )
# 
# process_drift_alerts(drift)
# plot(drift, type = "trajectory", metric = "irt_difficulty")
# plot(drift, type = "delta", metric = "dwell_ms")
# plot(drift, type = "heatmap")
# plot(drift, type = "control", metric = "valid_gaze_prop")

## -----------------------------------------------------------------------------
# drift_by_device(deployment_monitor, device = "device_id")
# drift_by_site(deployment_monitor, site = "site_id")
# drift_by_vendor(deployment_monitor, vendor = "vendor")
# drift_by_stimulus_version(deployment_monitor, stimulus_version = "stimulus_version")

