## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", fig.width = 8, fig.height = 4.7)
set.seed(20261009)

## ----acquisition-intervals, eval=requireNamespace("ggplot2", quietly=TRUE)----
time_s <- cumsum(c(0, rep(.010, 15), 0, .055, .001,
                  rep(.010, 20)))
delta_ms <- 1000 * diff(time_s)
intervals <- data.frame(interval_ms = delta_ms)
ggplot2::ggplot(intervals, ggplot2::aes(x = interval_ms)) +
  ggplot2::geom_histogram(binwidth = 2, boundary = 0, fill = "#387C88",
                          colour = "white", linewidth = .2) +
  ggplot2::geom_vline(xintercept = 10, linetype = 2, colour = "#A65346") +
  ggplot2::labs(
    title = "Recorded intervals, including duplicates and gaps",
    subtitle = "Synthetic 100 Hz target; 500 Hz interpolation would not increase temporal information",
    x = "Consecutive recorded timestamp interval (ms)",
    y = "Count"
  ) +
  ggplot2::theme_minimal(base_size = 12)

## ----paired-observations, eval=requireNamespace("ggplot2", quietly=TRUE)------
n <- 30L
participant <- data.frame(
  id = seq_len(n),
  baseline = stats::rnorm(n, mean = .50, sd = .13)
)
participant$stimulus <- participant$baseline +
  stats::rnorm(n, mean = .09, sd = .08)
long <- rbind(
  data.frame(id = participant$id, condition = "Baseline",
             dwell_s = participant$baseline),
  data.frame(id = participant$id, condition = "Stimulus",
             dwell_s = participant$stimulus)
)
long$condition <- factor(long$condition, levels = c("Baseline", "Stimulus"))
ggplot2::ggplot(long, ggplot2::aes(
  x = condition, y = dwell_s, group = id
)) +
  ggplot2::geom_line(alpha = .3, colour = "#82919C", linewidth = .4) +
  ggplot2::geom_point(colour = "#387C88", size = 1.8, alpha = .75) +
  ggplot2::labs(
    title = "Within-participant dwell-time changes",
    subtitle = "Synthetic participant-level AOI summaries; 30 independent participants",
    x = NULL, y = "AOI dwell time (seconds)"
  ) +
  ggplot2::theme_minimal(base_size = 12)

## ----paired-bootstrap, eval=requireNamespace("ggplot2", quietly=TRUE)---------
paired_diff <- participant$stimulus - participant$baseline
boots <- replicate(2000L, mean(sample(
  paired_diff, size = length(paired_diff), replace = TRUE
)))
limits <- as.numeric(stats::quantile(boots, c(.025, .975)))
observed <- mean(paired_diff)
ggplot2::ggplot(data.frame(draw = boots), ggplot2::aes(y = draw, x = 1)) +
  ggplot2::geom_violin(fill = "#8FBAC3", alpha = .68, width = .52) +
  ggplot2::geom_pointrange(
    data = data.frame(draw = observed, lo = limits[1], hi = limits[2]),
    ggplot2::aes(ymin = lo, ymax = hi),
    colour = "#245B65", linewidth = .65
  ) +
  ggplot2::geom_hline(yintercept = 0, linetype = 2) +
  ggplot2::scale_x_continuous(breaks = 1, labels = "Stimulus − baseline") +
  ggplot2::labs(
    title = "Bootstrap sampling distribution of paired mean difference",
    subtitle = "Synthetic data; participant bootstrap, 95% percentile interval (not BCa)",
    x = NULL, y = "Difference in AOI dwell time (seconds)"
  ) +
  ggplot2::theme_minimal(base_size = 12)

## ----delta-sensitivity, eval=requireNamespace("ggplot2", quietly=TRUE)--------
scenario <- data.frame(
  delta = seq(-10, 10, by = .5),
  missing_fraction = .5,
  observed_mean = 11
)
scenario$scenario_mean <- scenario$observed_mean +
  scenario$missing_fraction * scenario$delta
ggplot2::ggplot(
  scenario, ggplot2::aes(x = delta, y = scenario_mean)
) +
  ggplot2::geom_line(linewidth = 1.1, colour = "#387C88") +
  ggplot2::geom_hline(yintercept = 11, linetype = 2) +
  ggplot2::labs(
    title = "Pattern-mixture scenario, not a missingness-mechanism diagnosis",
    subtitle = "Synthetic missing fraction 50%; delta is supplied in original outcome units",
    x = "Assumed unavailable-outcome shift (seconds)",
    y = "Hypothetical overall mean (seconds)"
  ) +
  ggplot2::theme_minimal(base_size = 12)

