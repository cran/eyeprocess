## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
Q <- rbind(c(1,0), c(0,1), c(1,1), c(1,0))
aud <- eyeprocess_cdm_qmatrix_audit(Q)
aud
profiles <- eyeprocess_cdm_attribute_profiles(2)[, c("A1","A2")]
eta <- eyeprocess_cdm_dina_ideal_response(Q, profiles)
eyeprocess_cdm_dina_probability(eta)

## ----m2-visual-qmatrix, fig.width=6.5, fig.height=4.5, fig.align='center', fig.cap='Q-matrix structure for a small deterministic cognitive-diagnosis example.'----
viz_Q <- rbind(
  c(1, 0),
  c(0, 1),
  c(1, 1),
  c(1, 0),
  c(0, 1),
  c(1, 1)
)

rownames(viz_Q) <- paste0('Item ', seq_len(nrow(viz_Q)))
colnames(viz_Q) <- c('Attribute 1', 'Attribute 2')

viz_qmatrix <- eyeprocess::eyeprocess_cdm_qmatrix_audit(viz_Q)

stopifnot(
  inherits(viz_qmatrix, 'eye_cdm_qmatrix_audit')
)

plot(viz_qmatrix)

