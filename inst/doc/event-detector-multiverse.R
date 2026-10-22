## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 4.5
)
library(eyeprocess)

## -----------------------------------------------------------------------------
ivt25 <- define_event_detector_spec(
  "ivt25",
  "ivt",
  velocity_threshold = 25,
  minimum_duration_ms = 60,
  maximum_gap_ms = 75,
  sampling_rate = 60,
  coordinate_unit = "degrees"
)

ivt35 <- define_event_detector_spec(
  "ivt35",
  "ivt",
  velocity_threshold = 35,
  minimum_duration_ms = 60,
  maximum_gap_ms = 75,
  sampling_rate = 60,
  coordinate_unit = "degrees"
)

idt_a <- define_event_detector_spec(
  "idt_A",
  "idt",
  dispersion_threshold = 1.2,
  minimum_duration_ms = 80,
  sampling_rate = 60,
  coordinate_unit = "degrees"
)

adaptive <- define_event_detector_spec(
  "adaptive",
  "adaptive_velocity",
  minimum_duration_ms = 60,
  maximum_gap_ms = 75,
  sampling_rate = 60,
  coordinate_unit = "degrees",
  parameters = list(
    noise_factor = 4,
    minimum_velocity_threshold = 20
  )
)

multiverse <- create_detector_multiverse(
  list(ivt25, ivt35, idt_a, adaptive)
)

multiverse$manifest[, c(
  "detector_id",
  "algorithm",
  "velocity_threshold",
  "dispersion_threshold",
  "minimum_duration_ms"
)]

## -----------------------------------------------------------------------------
dat <- simulate_detector_multiverse_data(
  n_participants = 4,
  sampling_rate = 60,
  seed = 20260918
)

detected <- run_detector_multiverse(
  dat,
  multiverse,
  continue_on_error = TRUE
)

summarise_detector_events(detected)

## -----------------------------------------------------------------------------
agreement <- estimate_detector_agreement(detected)
agreement[, c(
  "detector_a",
  "detector_b",
  "matched_event_precision",
  "matched_event_recall",
  "f1",
  "mean_event_overlap"
)]

## ----detector-agreement, fig.cap="Pairwise temporal agreement among successful fixation catalogues."----
plot_detector_agreement(detected)

## -----------------------------------------------------------------------------
features <- propagate_detector_to_aoi(
  detected,
  overlap = "error"
)
features <- propagate_detector_to_features(features)

head(features$features[, c(
  "detector_id",
  "participant_id",
  "trial_id",
  "condition_id",
  "aoi_id",
  "fixation_count",
  "dwell_time_ms",
  "ttff_ms",
  "revisits"
)])

## ----feature-sensitivity, fig.cap="Synthetic disclosure-AOI dwell across detector specifications."----
plot_detector_feature_distributions(
  features,
  feature = "dwell_time_ms",
  aoi_id = "disclosure"
)

## -----------------------------------------------------------------------------
model_spec <- list(
  engine = "stats_lm",
  formula = dwell_time_ms ~ condition_id + participant_id,
  outcome = "dwell_time_ms",
  aoi_id = "disclosure"
)

inference <- run_detector_inference_multiverse(
  features,
  model_spec,
  minimum_valid_fraction = 0.5
)

condition_term <- grep(
  "condition_id",
  inference$coefficients$term,
  value = TRUE
)[1]

stability <- assess_detector_inference_stability(
  inference,
  term = condition_term,
  substantive_threshold = 100,
  direction = "above"
)

stability

## -----------------------------------------------------------------------------
inference$input_audit[, c(
  "detector_id",
  "input_rows",
  "aoi_selected_rows",
  "quality_excluded_rows",
  "outcome_missing_rows",
  "model_rows_used",
  "status"
)]

## ----coefficient-stability, fig.cap="Synthetic condition coefficient and confidence interval across detector specifications."----
plot_detector_coefficient_stability(
  inference,
  term = condition_term
)

## ----remodnav-spec, eval=FALSE------------------------------------------------
# remodnav <- define_event_detector_spec(
#   "remodnav",
#   "remodnav",
#   minimum_duration_ms = 60,
#   sampling_rate = 60,
#   coordinate_unit = "degrees",
#   parameters = list(
#     noise_factor = 5
#   )
# )

## -----------------------------------------------------------------------------
report <- report_detector_multiverse(
  features,
  inference = inference,
  term = condition_term,
  substantive_threshold = 100
)

cat(substr(report, 1, 800), "...")

