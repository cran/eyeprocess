## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)
library(eyeprocess)

## -----------------------------------------------------------------------------
# ws <- process_window_spec(width_ms = 1000, step_ms = 500,
#                           start_ms = 0, end_ms = 3000)
# 
# w <- extract_process_windows(
#   samples,
#   person = "person_id", trial = "trial_id", time = "time_ms",
#   spec = ws,
#   pupil = "pupil_bc", gaze_x = "x", gaze_y = "y", aoi = "aoi"
# )
# 
# validate_process_windows(w)
# summarize_process_windows(w)

## -----------------------------------------------------------------------------
# wsens <- audit_process_window_sensitivity(
#   samples,
#   widths_ms = c(250, 500, 1000, 1500),
#   steps_ms = c(100, 250, 500),
#   metric = "pupil_mean",
#   person = "person_id", trial = "trial_id", time = "time_ms"
# )
# plot(wsens)

## -----------------------------------------------------------------------------
# traj <- aoi_trajectory_features(
#   samples,
#   person = "person_id", trial = "trial_id", time = "time_ms", aoi = "aoi",
#   bin_ms = 100, degree = 3
# )
# plot(traj)

