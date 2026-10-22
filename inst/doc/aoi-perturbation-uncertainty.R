## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 7, fig.height = 4.5)
library(eyeprocess)

## ----data---------------------------------------------------------------------
aois <- data.frame(
  aoi_id = c("headline", "image", "claim", "disclosure", "cta"),
  xmin = c(100, 300, 300, 300, 680),
  xmax = c(400, 700, 700, 700, 920),
  ymin = c(80, 190, 360, 500, 600),
  ymax = c(180, 340, 480, 590, 710)
)

set.seed(12)
centers <- data.frame(
  x = c(250, 500, 500, 500, 800),
  y = c(130, 270, 430, 560, 650),
  aoi = c("headline", "image", "claim", "disclosure", "cta")
)

rows <- list()
k <- 0L
for (participant in 1:8) {
  condition <- participant %% 2
  for (trial in 1:3) {
    for (j in seq_len(nrow(centers))) {
      n <- 5L + if (centers$aoi[j] == "disclosure" && condition == 1) 3L else 0L
      for (fix in seq_len(n)) {
        k <- k + 1L
        rows[[k]] <- data.frame(
          obs = k,
          participant = paste0("p", participant),
          trial = trial,
          condition = condition,
          x = rnorm(1, centers$x[j], 35),
          y = rnorm(1, centers$y[j], 22),
          duration = runif(1, .06, .18),
          time = j - 1 + (fix - 1) / 20
        )
      }
    }
  }
}
fixations <- do.call(rbind, rows)

## ----grid---------------------------------------------------------------------
grid <- create_aoi_perturbation_grid(
  dilations = c(.25, .50, 1.00),
  erosions = .25,
  translations_x = .50,
  translations_y = .50,
  unit = "deg",
  include_baseline = TRUE,
  screen_width_px = 1024,
  screen_height_px = 768,
  viewing_distance = 60,
  physical_screen_size = c(53.1, 29.9),
  boundary_policy = "allow"
)

grid$table

## ----callback-----------------------------------------------------------------
model_callback <- function(features, assigned, spec) {
  target <- features[features$aoi == "disclosure", , drop = FALSE]
  condition_map <- unique(assigned[, c("participant", "condition")])
  target <- merge(target, condition_map, by = "participant", all.x = TRUE)

  fit <- stats::lm(dwell ~ condition, data = target)
  co <- summary(fit)$coefficients
  if (!"condition" %in% rownames(co)) stop("condition coefficient unavailable")

  estimate <- unname(co["condition", "Estimate"])
  se <- unname(co["condition", "Std. Error"])

  data.frame(
    term = "condition",
    estimate = estimate,
    SE = se,
    CI_low = estimate - 1.96 * se,
    CI_high = estimate + 1.96 * se,
    p_value = unname(co["condition", "Pr(>|t|)"]),
    model_converged = TRUE,
    N = stats::nobs(fit)
  )
}

## ----run----------------------------------------------------------------------
result <- run_aoi_sensitivity_analysis(
  fixations,
  aois,
  grid,
  x_col = "x",
  y_col = "y",
  observation_id_col = "obs",
  participant_col = "participant",
  trial_col = "trial",
  duration_col = "duration",
  time_col = "time",
  observation_level = "fixation",
  overlap_policy = "ambiguous",
  model_callback = model_callback,
  preprocessing_specification = list(duration_unit = "seconds"),
  event_detector = "synthetic_fixations",
  quality_rules = list(missing = "preserve", overlap = "ambiguous"),
  model_specification = list(
    family = "lm",
    outcome = "disclosure_dwell",
    predictor = "condition"
  )
)

summary <- summarise_aoi_sensitivity(result)
summary$assignment_stability
summary$inference_stability

## ----geometry-plot------------------------------------------------------------
plot_aoi_perturbations(
  result,
  perturbation_id = "dilate_0.5_deg",
  data = fixations[seq(1, nrow(fixations), by = 12), ],
  x_col = "x",
  y_col = "y"
)

## ----assignment-plot----------------------------------------------------------
plot_aoi_assignment_stability(result)

## ----coefficient-plot---------------------------------------------------------
plot_aoi_coefficient_stability(result, "condition")

## ----surface-example, eval=FALSE----------------------------------------------
# surface_pairs <- as.matrix(expand.grid(
#   margin_x = c(-.25, 0, .25, .50),
#   margin_y = c(-.25, 0, .25, .50)
# ))
# surface_grid <- create_aoi_perturbation_grid(
#   anisotropic = surface_pairs,
#   unit = "deg",
#   include_baseline = TRUE,
#   screen_width_px = 1024,
#   screen_height_px = 768,
#   viewing_distance = 60,
#   physical_screen_size = c(53.1, 29.9),
#   boundary_policy = "allow"
# )
# surface_result <- run_aoi_sensitivity_analysis(
#   fixations, aois, surface_grid,
#   x_col = "x", y_col = "y",
#   observation_id_col = "obs",
#   participant_col = "participant",
#   trial_col = "trial",
#   duration_col = "duration",
#   time_col = "time",
#   observation_level = "fixation"
# )
# plot_aoi_robustness_surface(surface_result)

## ----failure------------------------------------------------------------------
failure_grid <- create_aoi_perturbation_grid(erosions = 500)
failure_result <- apply_aoi_perturbation_grid(aois, failure_grid)
failure_result$audit

## ----report-------------------------------------------------------------------
cat(report_aoi_sensitivity(result))

