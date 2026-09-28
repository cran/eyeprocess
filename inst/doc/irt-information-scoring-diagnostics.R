## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
items <- data.frame(
  item_id = paste0("I", 1:8), a = seq(.8, 1.5, length.out = 8),
  b = seq(-1.5, 1.5, length.out = 8), c = 0, d = 1
)
info <- eyeprocess_irt_test_information(seq(-3, 3, by = .25), items)
head(info)
eyeprocess_irt_measurement_precision_profile(info$theta, items)

## ----m2-visual-test-information, fig.width=7, fig.height=4.5, fig.align='center', fig.cap='Test information across the latent-trait continuum for a deterministic illustrative item bank.'----
viz_items <- data.frame(
  item_id = paste0('I', 1:8),
  a = seq(0.8, 1.5, length.out = 8),
  b = seq(-1.5, 1.5, length.out = 8),
  c = 0,
  d = 1
)

viz_theta <- seq(-3, 3, by = 0.25)

viz_information <- eyeprocess::eyeprocess_irt_test_information(
  viz_theta,
  viz_items
)

stopifnot(
  inherits(viz_information, 'eye_irt_information_profile')
)

plot(viz_information)

## ----m2-visual-q3, fig.width=6.5, fig.height=5.5, fig.align='center', fig.cap='Residual Q3 dependence matrix for a deterministic simulated response set.'----
viz_sim <- eyeprocess::simulate_eyeprocess_irt_binary(
  80L,
  viz_items,
  missing_rate = 0.10,
  seed = 12L
)

viz_q3 <- eyeprocess::eyeprocess_irt_q3(
  viz_sim$responses,
  viz_sim$probabilities
)

stopifnot(
  inherits(viz_q3, 'eye_irt_q3_matrix')
)

plot(viz_q3)

