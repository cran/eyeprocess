## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
eyeprocess::validation_evidence_levels()

## -----------------------------------------------------------------------------
corpus <- eyeprocess::public_validation_corpus()
corpus[, c("ecosystem", "device", "corpus", "evidence_goal", "access")]

## ----eval=FALSE---------------------------------------------------------------
# spec <- semantic_fidelity_spec(
#   timestamp_tolerance = 1e-6,
#   coordinate_tolerance = 1e-6,
#   pupil_tolerance = 1e-6
# )
# 
# audit <- semantic_roundtrip_audit(
#   original = native_canonical,
#   roundtrip = bids_reimported,
#   key = c("recording_id", "sample_index"),
#   fields = c("timestamp", "gaze_x", "gaze_y", "pupil", "eye", "event")
# )
# 
# semantic_loss_map(audit)
# plot(audit)

## ----eval=FALSE---------------------------------------------------------------
# timestamp_fidelity_audit(
#   source = imported_native,
#   roundtrip = imported_bids,
#   source_time = "device_time",
#   roundtrip_time = "device_time",
#   tolerance = 1e-6
# )
# 
# validate_vendor_timestamp_semantics(imported_native)

## ----eval=FALSE---------------------------------------------------------------
# coordinate_fidelity_audit(
#   source = original,
#   roundtrip = transformed_back,
#   source_x = "gaze_x",
#   source_y = "gaze_y",
#   roundtrip_x = "gaze_x",
#   roundtrip_y = "gaze_y"
# )
# 
# pupil_unit_fidelity_audit(
#   source = original,
#   roundtrip = transformed_back,
#   source_pupil = "pupil_left",
#   roundtrip_pupil = "pupil_left"
# )

## ----eval=FALSE---------------------------------------------------------------
# validate_bids_eye_semantics(
#   data = bids_table,
#   metadata = bids_json
# )

## ----eval=FALSE---------------------------------------------------------------
# event_semantics_audit(original_events, roundtrip_events,
#                       key = "event_id", label = "trial_type", time = "timestamp")
# validate_hed_event_semantics(events)

## ----eval=FALSE---------------------------------------------------------------
# base <- build_compatibility_matrix()
# case_evidence <- data.frame(
#   ecosystem = "Gazepoint",
#   device = "GP3 HD",
#   evidence_level = "independent-public-real",
#   semantic_roundtrip_pass = FALSE
# )
# 
# mat <- compatibility_evidence_matrix(base, case_evidence)
# plot(mat)

