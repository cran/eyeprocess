## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# gp_profile_export("data/P001")
# gp_audit_file_pairs("data/P001")
# gp_list_export_fields("data/P001/P001-user.csv")
# gp_validate_export("data/P001")

## -----------------------------------------------------------------------------
# x <- read_gazepoint_folder(
#   "data/P001",
#   include = c("gaze", "fixations", "events", "biometrics", "aoi"),
#   participant_id = "P001"
# )
# 
# x <- gp_reconstruct_trials(
#   x,
#   start_events = c("TRIAL_START", "START_TRIAL"),
#   end_events = c("TRIAL_END", "END_TRIAL")
# )
# 
# x <- gp_reconstruct_stimuli(x)
# x <- gp_align_media_ids(x)

## -----------------------------------------------------------------------------
# gp_check_sampling_rate(x)
# gp_check_validity_fields(x)
# gp_check_fixation_ids(x)
# gp_check_media_timing(x)
# gp_check_pupil_channels(x)
# gp_check_biometrics_sync(x)

## -----------------------------------------------------------------------------
# gaze <- read_gazepoint_gaze("P001-user.csv")
# bio  <- read_gazepoint_biometrics("P001-biometrics.csv")
# 
# # Marker times may be extracted from each object's event table.
# source_markers <- bio$events$timestamp_seconds[bio$events$event_name == "SYNC"]
# target_markers <- gaze$events$timestamp_seconds[gaze$events$event_name == "SYNC"]
# 
# x <- synchronize_eye_biometrics(
#   gaze,
#   bio,
#   source_markers = source_markers,
#   target_markers = target_markers,
#   method = "linear"
# )

## ----eval=FALSE---------------------------------------------------------------
# root <- "C:/path/to/gazepoint-export-folder"
# 
# gp_pair_exports(root)
# x <- read_gazepoint_folder(root)

## ----eval=FALSE---------------------------------------------------------------
# summary <- read_gazepoint_summary(
#   file.path(root, "Data_Summary_export_02-20-26-01.28.43.csv")
# )
# summary
# 
# aoi_data <- read_gazepoint_aoi_statistics(summary$path)

