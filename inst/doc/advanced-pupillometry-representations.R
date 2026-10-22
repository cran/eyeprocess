## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)
library(eyeprocess)

## -----------------------------------------------------------------------------
# freq <- pupil_frequency_features(
#   samples,
#   by = c("person_id", "trial_id"),
#   time = "time_ms", pupil = "pupil_gaze_corrected_bc",
#   sampling_rate_hz = 60
# )
# plot(freq)

## -----------------------------------------------------------------------------
# deconv <- fit_pupil_event_deconvolution(
#   samples,
#   by = c("person_id", "trial_id"),
#   time = "time_ms", pupil = "pupil_gaze_corrected_bc",
#   events = list(stimulus = 0, information = "information_onset_ms", action = "response_time_ms")
# )
# 
# pupil_event_effects(deconv)
# plot(deconv, type = "observed_fitted")
# plot(deconv, type = "effects")
# compare_pupil_kernels(samples, tmax_values = c(512, 930),
#                       by = c("person_id", "trial_id"),
#                       time = "time_ms", pupil = "pupil_gaze_corrected_bc",
#                       events = list(stimulus = 0))

## -----------------------------------------------------------------------------
# conf <- fit_pupil_confound_model(
#   trial_data,
#   pupil = "pupil_peak",
#   luminance = "screen_luminance",
#   trial_order = "trial_sequence",
#   theta = "theta_hat",
#   person = "person_id", item = "item_id"
# )
# 
# adjust_pupil_confounds(conf)
# pupil_confound_effects(conf)
# compare_raw_adjusted_pupil(conf)
# plot(conf, type = "raw_adjusted")
# plot(conf, type = "theta_luminance_surface")

## -----------------------------------------------------------------------------
# f <- filter_pupil_signal(raw_pupil, width = 9)
# audit_signal_filter(f)
# plot(f)
# compare_signal_filters(raw_pupil)

