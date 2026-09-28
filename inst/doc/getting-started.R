## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# library(eyeprocess)
# 
# x <- simulate_eye_dataset(n_person = 20, n_item = 8, seed = 42)
# x
# summary(x)
# validate_eye_dataset(x)
# provenance_manifest(x)

## -----------------------------------------------------------------------------
# spec <- preprocess_spec(
#   gaze_filter = "median",
#   pupil_interpolation = "linear",
#   pupil_filter = "median",
#   fixation_algorithm = "ivt"
# )
# 
# x <- preprocess_eye(x, spec)
# x <- build_aoi_visits(x)
# x <- derive_all_features(x)
# 
# analysis_readiness(x)
# feature_dictionary(x)

## -----------------------------------------------------------------------------
# trial <- x$intervals$trial_id[1]
# plot_eye_overview(x)
# plot_scanpath(x, trial_id = trial)
# plot_pupil_timeseries(x, trial_id = trial)
# plot_transition_matrix(x)

## -----------------------------------------------------------------------------
# write_eye_dataset(x, "analysis/eye-dataset.rds")
# export_canonical(x, "analysis/canonical-folder")
# report_eye_dataset(x, "analysis/eyeprocess-report.md", include_plots = TRUE)

