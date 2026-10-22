## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
design <- eyeprocess_irt_recovery_design(sample_size = 250L, n_items = 12L,
                                          missing_rate = c(0,.15), testlet_sd = c(0,.35),
                                          replications = 5L, seed = 20260811L)
head(design)
eyeprocess_irt_misspecification_suite()

## ----m2-visual-sbc, fig.width=7, fig.height=4.5, fig.align='center', fig.cap='Simulation-based calibration diagnostic for the deterministic known-item example.'----
viz_items <- data.frame(
  item_id = paste0('I', 1:8),
  a = seq(0.8, 1.5, length.out = 8),
  b = seq(-1.5, 1.5, length.out = 8),
  c = 0,
  d = 1
)

viz_sbc <- eyeprocess::run_eyeprocess_irt_ability_sbc(
  items = viz_items,
  replications = 20L,
  posterior_draws = 19L,
  theta_grid = seq(-5, 5, length.out = 201L),
  seed = 902L
)

stopifnot(
  inherits(viz_sbc, 'eye_irt_sbc_evidence')
)

plot(viz_sbc)

