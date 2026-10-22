## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 8, fig.height = 4.8)

## -----------------------------------------------------------------------------
library(eyeprocess)

## ----data---------------------------------------------------------------------
validation <- simulate_gaze_quality_calibration(
  seed = 20260918,
  samples_per_target = 18,
  nominal_sampling_hz = 60
)

quality <- create_gaze_quality_report(
  validation,
  by = c("profile", "target_id"),
  valid = "valid",
  missing_reason = "missing_reason",
  nominal_sampling_hz = 60,
  bcea_probability = 0.68,
  preprocessing_spec = "synthetic raw validation samples; no interpolation",
  quality_rules = "descriptive review only"
)

center_target <- quality[quality$target_id == 5, ]

## ----accuracy-----------------------------------------------------------------
plot_gaze_accuracy(center_target)

## ----precision----------------------------------------------------------------
plot_gaze_precision(center_target)

## ----bcea---------------------------------------------------------------------
plot_bcea(center_target)

## ----sampling-----------------------------------------------------------------
irregular <- validation[
  validation$profile == "irregular_sampling" &
    validation$target_id == 5,
]
plot_sampling_intervals(irregular, time = "timestamp_ms", time_unit = "ms")

## ----dashboard, fig.width=9, fig.height=7-------------------------------------
plot_gaze_quality_dashboard(center_target)

## ----sensitivity--------------------------------------------------------------
reviewed <- create_gaze_quality_report(
  validation,
  by = c("profile", "target_id"),
  valid = "valid",
  missing_reason = "missing_reason",
  nominal_sampling_hz = 60,
  thresholds = list(
    accuracy_mean = list(max = 1.0),
    valid_sample_fraction = list(min = 0.80)
  )
)

table(reviewed$review_required)
attr(reviewed, "gaze_quality_provenance")$automatic_exclusion

## ----reporting----------------------------------------------------------------
report_gaze_quality(center_target)

