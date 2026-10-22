## ----detector-failure, eval=FALSE---------------------------------------------
# external_fail <- define_event_detector_spec(
#   "external_fail",
#   "external",
#   implementation = "deliberate_failure_fixture",
#   callback = function(data, spec) {
#     stop("deliberate external detector failure")
#   }
# )
# 
# detected <- run_detector_multiverse(
#   d,
#   list(ivt30, external_fail),
#   continue_on_error = TRUE
# )
# 
# detected$status
# detected$failures

## ----input-audit, eval=FALSE--------------------------------------------------
# inference <- run_detector_inference_multiverse(
#   features,
#   list(
#     engine = "callback",
#     formula = dwell_time_ms ~ condition_id,
#     outcome = "dwell_time_ms",
#     aoi_id = "disclosure"
#   ),
#   model_callback = tidy_callback,
#   minimum_valid_fraction = .5
# )
# 
# inference$input_audit
# inference$warnings

## ----duplicate-term, eval=FALSE-----------------------------------------------
# duplicate_callback <- function(data, model_spec) {
#   row <- tidy_callback(data, model_spec)
#   rbind(row, row)
# }
# 
# invalid <- run_detector_inference_multiverse(
#   features,
#   model_spec,
#   model_callback = duplicate_callback
# )
# 
# invalid$failures

