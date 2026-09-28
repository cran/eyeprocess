## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# plans <- list(
#  synthetic_corruption_plan(missingness=.05),
#  synthetic_corruption_plan(missingness=.20, sampling_jitter_sd=2),
#  synthetic_corruption_plan(pupil_dropout=.30, gaze_offset_x=.02)
# )
# st <- stress_test_process_pipeline(data, plans, analysis_fun)
# stress_test_summary(st)
# plot(st, severity="missingness", metric="effect")

