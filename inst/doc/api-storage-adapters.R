## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")

## ----eval=FALSE---------------------------------------------------------------
# eyeprocess_api_version()
# object_schema("eye_dataset")
# object_schema("eyeprocess_model")
# validate_model_object(fit)
# upgrade_eye_dataset(old_data)
# upgrade_eyeprocess_model(old_fit)

## ----eval=FALSE---------------------------------------------------------------
# spec <- partition_eye_storage(
#   by = c("participant_id", "session_id", "recording_id"),
#   format = "parquet",
#   compression = "zstd",
#   max_rows = 1000000L
# )
# 
# store <- write_partitioned_eye_storage(x, "analysis/store", spec)
# query_eye_storage(
#   store,
#   table = "gaze_samples",
#   filters = list(participant_id = c("P001", "P002")),
#   columns = c("participant_id", "recording_id", "time", "x", "y")
# )
# validate_eye_storage_metadata(store)
# detect_corrupt_partitions(store)
# storage_transaction_manifest(store)

## ----eval=FALSE---------------------------------------------------------------
# migrate_eye_storage_schema(store, "analysis/store-v2", target_version = "2.0.0")
# benchmark_eye_storage(x, formats = c("rds", "csv", "parquet"))

## ----eval=FALSE---------------------------------------------------------------
# external_model_engines()
# fit_mirt_adapter(response_matrix, model = 1, purpose = "unidimensional item calibration")
# fit_tam_adapter(response_matrix, purpose = "Rasch sensitivity analysis")
# fit_brms_adapter(score ~ dwell + (1|participant_id) + (1|item_id), trials, purpose = "Bayesian explanatory model")
# fit_lnirt_adapter(list(Y = response_matrix, RT = rt_matrix), purpose = "joint accuracy-RT comparison")

