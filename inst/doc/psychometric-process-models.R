## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# y  <- response_matrix(x)
# rt <- response_time_matrix(x, log_transform = TRUE)
# aligned <- align_response_matrices(y, rt)

## -----------------------------------------------------------------------------
# fit_mirt <- fit_irt(x, engine = "mirt", model = 1, itemtype = "2PL")
# fit_tam  <- fit_irt(x, engine = "TAM")
# 
# fit_explanatory <- fit_explanatory_irt(
#   x,
#   score ~ dwell_time + first_fixation_latency + pupil_auc,
#   engine = "lme4"
# )

## -----------------------------------------------------------------------------
# fit_rt <- fit_accuracy_rt(x, engine = "LNIRT")

## -----------------------------------------------------------------------------
# spec <- process_irt_spec(
#   response = "score",
#   gaze_features = c("dwell_time", "first_fixation_latency"),
#   pupil_features = c("pupil_auc"),
#   response_time = "response_time"
# )
# 
# fit <- fit_process_irt(x, spec, engine = "lme4")
# process_irt_diagnostics(fit)
# 
# shared <- fit_shared_process_factor(
#   x,
#   features = c("dwell_time", "fixation_count", "pupil_auc")
# )

