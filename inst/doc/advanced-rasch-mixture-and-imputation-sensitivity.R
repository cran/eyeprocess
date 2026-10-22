## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)
library(eyeprocess)

## -----------------------------------------------------------------------------
# mix <- fit_mixture_irt_process_classes(
#   binary_response_matrix,
#   n_classes = 2,
#   itemtype = "2PL"
# )
# plot(mix)

## -----------------------------------------------------------------------------
# alignment <- map_latent_classes_to_process_profiles(
#   class_membership,
#   person_process_data,
#   person = "person_id",
#   class_col = "class",
#   process_features = c("dwell_ms", "pupil_peak", "aoi_entropy", "revisits")
# )
# plot(alignment)

## -----------------------------------------------------------------------------
# np <- audit_nonparametric_rasch(
#   binary_response_matrix,
#   methods = c("T1", "T10"),
#   n = 100
# )
# np$status
# plot(np, method = "T1")

## -----------------------------------------------------------------------------
# red <- audit_item_reduction_sensitivity(
#   erm_rasch,
#   criterion = list("itemfit"),
#   alpha = 0.05,
#   maxstep = 5
# )
# red$eliminated_items
# plot(red)

## -----------------------------------------------------------------------------
# imp <- biometric_imputation_sensitivity(
#   trial_process_data,
#   variables = c("rt_ms", "dwell_ms", "pupil_peak", "pupil_auc", "valid_gaze_prop"),
#   methods = c("mice", "missForest")
# )
# imp$missingness
# imp$status
# plot(imp)

## -----------------------------------------------------------------------------
# tree <- fit_process_rasch_tree(
#   binary_response_matrix,
#   covariates = person_process_covariates
# )
# plot(tree)

