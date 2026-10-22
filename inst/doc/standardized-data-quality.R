## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----synthetic----------------------------------------------------------------
library(eyeprocess)
x <- simulate_gaze_quality_calibration(samples_per_target = 8)
q <- create_gaze_quality_report(
  x,
  by = c("profile", "target_id"),
  valid = "valid",
  missing_reason = "missing_reason",
  nominal_sampling_hz = 60
)
q[c("profile", "target_id", "accuracy_mean", "precision_rms_s2s",
    "precision_sd", "bcea", "effective_sampling_hz", "data_loss_fraction")]

## ----sampling-----------------------------------------------------------------
summarise_sampling_quality(
  x[x$profile == "irregular_sampling", ],
  time = "timestamp_ms",
  nominal_sampling_hz = 60
)

## ----loss---------------------------------------------------------------------
compute_gaze_data_loss(
  x[x$profile == "missingness", ],
  valid = "valid",
  missing_reason = "missing_reason"
)

## ----review-------------------------------------------------------------------
flagged <- create_gaze_quality_report(
  x,
  by = c("profile", "target_id"),
  valid = "valid",
  thresholds = list(
    accuracy_mean = list(max = 1.0),
    valid_sample_fraction = list(min = 0.80)
  )
)
attr(flagged, "gaze_quality_provenance")$automatic_exclusion

## ----sensitivity--------------------------------------------------------------
reviewed <- create_gaze_quality_report(
  x,
  by = c("profile", "target_id"),
  valid = "valid",
  thresholds = list(
    accuracy_mean = list(max = 1.0),
    valid_sample_fraction = list(min = 0.80)
  )
)

analysis_keep <- reviewed[!reviewed$review_required, ]
analysis_flagged <- reviewed[reviewed$review_required, ]

