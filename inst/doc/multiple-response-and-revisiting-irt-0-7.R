## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
long <- data.frame(
  participant_id = rep(c("p1", "p2"), each = 4),
  item_id = "item1",
  option_id = rep(c("A", "B", "C", "D"), 2),
  selected = c(TRUE, FALSE, TRUE, FALSE,
               FALSE, TRUE, FALSE, TRUE)
)
encode_response_combinations(long)

## ----eval=FALSE---------------------------------------------------------------
# fit <- fit_multiple_response_process_irt(
#   option_trials,
#   selected = "selected",
#   theta = "theta",
#   item = "item_id",
#   option = "option_id",
#   gaze = "option_dwell_ms",
#   engine = "reference"
# )

## -----------------------------------------------------------------------------
set.seed(1)
r <- matrix(rnorm(400), ncol = 4,
            dimnames = list(NULL, paste0("option", 1:4)))
p <- r + matrix(rnorm(400, sd = .3), ncol = 4)
ld <- audit_process_local_dependence(r, p)
head(ld$pairs)
plot(ld)

## ----eval=FALSE---------------------------------------------------------------
# cdm <- fit_revisit_process_cdm(
#   response_matrix = Y,
#   q_matrix = Q,
#   process_data = process_log,
#   person_id = "participant_id",
#   revisited = "revisit_count",
#   rt = "response_time_ms",
#   gaze = c("stem_dwell_ms", "option_transition_count")
# )

