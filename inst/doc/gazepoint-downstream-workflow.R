## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# library(eyeprocess)
# 
# source_dir <- "path/to/eyeprocess-validation-corpus/cases/gazepoint-analysis-v7.2.0-demo"
# output_dir <- "path/to/eyeprocess-downstream-output"
# 
# result <- run_gazepoint_workflow(
#   source_dir,
#   output_dir = output_dir,
#   overwrite = TRUE
# )
# 
# result
# validate_gazepoint_workflow(result)

## ----eval=FALSE---------------------------------------------------------------
# spec <- gazepoint_workflow_spec(
#   expected_sampling_rate = 60,
#   minimum_valid_gaze = 0.80,
#   minimum_valid_pupil = 0.70,
#   pupil_interpolation = "linear",
#   pupil_max_gap_ms = 150,
#   pupil_filter = "median",
#   pupil_window = 5,
#   pupil_baseline = "none",
#   create_plots = TRUE,
#   create_html_report = TRUE,
#   retain_raw = TRUE
# )

## ----eval=FALSE---------------------------------------------------------------
# item_map <- data.frame(
#   stimulus_id = c("0", "1"),
#   item_id = c("item_control", "item_treatment"),
#   condition_id = c("control", "treatment")
# )
# 
# result <- run_gazepoint_workflow(
#   source_dir,
#   output_dir,
#   item_map = item_map,
#   spec = spec,
#   overwrite = TRUE
# )

## ----eval=FALSE---------------------------------------------------------------
# responses <- data.frame(
#   participant_id = c("User 3", "User 3"),
#   item_id = c("item_control", "item_treatment"),
#   response = c("yes", "no"),
#   score = c(1, 1),
#   response_time = c(6.1, 7.4)
# )
# 
# result <- run_gazepoint_workflow(
#   source_dir,
#   output_dir,
#   responses = responses,
#   item_map = item_map,
#   spec = spec,
#   overwrite = TRUE
# )

