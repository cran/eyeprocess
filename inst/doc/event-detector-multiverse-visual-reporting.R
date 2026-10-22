## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 7,
  fig.height = 4.6
)
library(eyeprocess)

## ----visual-data--------------------------------------------------------------
dat <- simulate_detector_multiverse_data(
  n_participants = 6,
  sampling_rate = 60,
  seed = 20260919
)

specs <- list(
  define_event_detector_spec(
    "ivt25", "ivt",
    velocity_threshold = 25,
    minimum_duration_ms = 60,
    maximum_gap_ms = 75,
    sampling_rate = 60,
    coordinate_unit = "degrees"
  ),
  define_event_detector_spec(
    "ivt30", "ivt",
    velocity_threshold = 30,
    minimum_duration_ms = 60,
    maximum_gap_ms = 75,
    sampling_rate = 60,
    coordinate_unit = "degrees"
  ),
  define_event_detector_spec(
    "ivt35", "ivt",
    velocity_threshold = 35,
    minimum_duration_ms = 60,
    maximum_gap_ms = 75,
    sampling_rate = 60,
    coordinate_unit = "degrees"
  ),
  define_event_detector_spec(
    "idt_A", "idt",
    dispersion_threshold = 1.2,
    minimum_duration_ms = 80,
    sampling_rate = 60,
    coordinate_unit = "degrees"
  ),
  define_event_detector_spec(
    "adaptive", "adaptive_velocity",
    minimum_duration_ms = 60,
    maximum_gap_ms = 75,
    sampling_rate = 60,
    coordinate_unit = "degrees",
    parameters = list(
      noise_factor = 4,
      minimum_velocity_threshold = 20
    )
  )
)

detected <- run_detector_multiverse(
  dat,
  create_detector_multiverse(specs, label = "visual_reporting"),
  continue_on_error = TRUE
)

## ----detector-event-counts, fig.cap="Detected fixation counts across the declared internal detector specifications."----
event_summary <- summarise_detector_events(detected)

graphics::barplot(
  event_summary$number_of_fixations,
  names.arg = event_summary$detector_id,
  las = 2,
  ylab = "Detected fixations",
  main = "Fixation count by detector"
)

## ----detector-agreement-visual, fig.cap="Pairwise temporal overlap among successful fixation catalogues."----
plot_detector_agreement(detected)

## ----propagate-visual---------------------------------------------------------
features <- propagate_detector_to_aoi(
  detected,
  overlap = "error"
)
features <- propagate_detector_to_features(features)

## ----detector-feature-visual, fig.cap="Disclosure-AOI dwell across detector specifications."----
plot_detector_feature_distributions(
  features,
  feature = "dwell_time_ms",
  aoi_id = "disclosure"
)

## ----detector-model-visual----------------------------------------------------
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

## ----detector-coefficient-visual, fig.cap="Synthetic condition coefficient and 95% confidence interval across detector specifications."----
plot_detector_coefficient_stability(
  inference,
  term = condition_term
)

## ----detector-input-audit-visual, fig.cap="Target-AOI rows and rows supplied to the identical model, by detector branch."----
audit <- inference$input_audit

row_accounting <- rbind(
  target_AOI_rows = audit$aoi_selected_rows,
  model_rows_used = audit$model_rows_used
)

graphics::barplot(
  row_accounting,
  beside = TRUE,
  names.arg = audit$detector_id,
  las = 2,
  ylab = "Rows",
  main = "Model-input accountability",
  legend.text = rownames(row_accounting),
  args.legend = list(x = "topright", bty = "n")
)

## ----detector-input-audit-table-----------------------------------------------
inference$input_audit[, c(
  "detector_id",
  "input_rows",
  "aoi_selected_rows",
  "quality_excluded_rows",
  "outcome_missing_rows",
  "model_rows_used",
  "status"
)]

## ----detector-stability-summary-----------------------------------------------
stability <- assess_detector_inference_stability(
  inference,
  term = condition_term,
  substantive_threshold = 100,
  direction = "above"
)

stability

