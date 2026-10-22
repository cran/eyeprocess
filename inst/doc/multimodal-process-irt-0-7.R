## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
spec <- irt_model_spec(
  id = "accuracy_time_gaze",
  latent = c("ability", "speed", "engagement"),
  channels = list(
    response = irt_response_channel("2pl"),
    rt       = irt_rt_channel("lognormal"),
    gaze     = irt_count_channel("negative_binomial")
  ),
  status = "experimental"
)
spec

## -----------------------------------------------------------------------------
irt_continuous_channel("censored_normal", value = "evidence_dwell_proportion")
irt_sequence_channel("scanpath", family = "hmm")

## -----------------------------------------------------------------------------
list_irt_models()

## ----eval=FALSE---------------------------------------------------------------
# register_irt_model(spec)
# validate_irt_model("accuracy_time_gaze", validation_data)
# promote_irt_model("accuracy_time_gaze", evidence = evidence_object)

## ----eval=FALSE---------------------------------------------------------------
# fit <- fit_joint_gaze_rt_irt(
#   data = trials,
#   response = "correct",
#   rt = "rt_ms",
#   gaze = "fixation_count",
#   person = "person_id",
#   item = "item_id",
#   gaze_family = "negative_binomial",
#   engine = "brms"
# )
# plot(fit)

## ----eval=FALSE---------------------------------------------------------------
# fit_joint_graded_rt_process_irt(
#   data = trials,
#   response = "rating",
#   rt = "rt_ms",
#   process = "fixation_count",
#   person = "person_id",
#   item = "item_id",
#   engine = "brms"
# )

## ----eval=FALSE---------------------------------------------------------------
# fit <- fit_nominal_gaze_irt(
#   data = option_trials,
#   response_option = "choice",
#   option_gaze = c("dwell_A", "dwell_B", "dwell_C", "dwell_D"),
#   item = "item_id",
#   person = "person_id"
# )
# 
# option_process_information(fit)
# distractor_process_map(fit)
# audit_distractor_attention(fit)
# plot(fit)

## ----eval=FALSE---------------------------------------------------------------
# missing <- classify_item_missingness(
#   trials,
#   response = "response",
#   reached = "reached",
#   inspected = "inspected_response_region",
#   started = "started_response"
# )
# 
# audit <- fit_omission_survival_irt(
#   data = missing,
#   response = "correct",
#   response_time = "rt",
#   omission_time = "elapsed",
#   reached = "reached",
#   person = "person_id",
#   item = "item_id"
# )
# plot(audit)

## ----eval=FALSE---------------------------------------------------------------
# facet_fit <- fit_manyfacet_process_irt(
#   data = trials,
#   response = "correct",
#   process = "fixation_count",
#   person = "person_id",
#   item = "item_id",
#   device = "device",
#   session = "session",
#   algorithm = "fixation_algorithm"
# )
# 
# facet_effects(facet_fit)
# audit_process_measurement_invariance(facet_fit)
# plot(facet_fit)

## ----eval=FALSE---------------------------------------------------------------
# cn <- fit_censored_normal_process_irt(
#   response_matrix = aoi_proportion_matrix,
#   theta = calibration_theta,
#   lower = 0,
#   upper = 1
# )
# predict(cn, theta = seq(-2, 2, length.out = 9))

