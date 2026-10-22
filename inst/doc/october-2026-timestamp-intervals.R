## ----timestamp-synthetic-data-------------------------------------------------
set.seed(20261022)
n <- 501L
nominal_ms <- 1000 / 120
interval_ms <- pmax(0.1, stats::rnorm(n - 1L, nominal_ms, 0.55))
delays <- seq(95L, 395L, by = 60L)
interval_ms[delays] <- interval_ms[delays] * 2.6
timestamp_ms <- c(0, cumsum(interval_ms))
realized_rate_hz <- (length(timestamp_ms) - 1L) * 1000 /
  (tail(timestamp_ms, 1L) - timestamp_ms[1L])
stopifnot(length(timestamp_ms) == n,
          all(diff(timestamp_ms) > 0),
          realized_rate_hz < 120)
data.frame(declared_hz = 120, observed_mean_hz = realized_rate_hz,
           interval_q05_ms = unname(stats::quantile(interval_ms, 0.05)),
           interval_median_ms = unname(stats::median(interval_ms)),
           interval_q95_ms = unname(stats::quantile(interval_ms, 0.95)))

## ----timestamp-interval-figure, fig.width=9, fig.height=4, fig.cap="Synthetic timestamp differences. Dashed line shows the nominal device interval, not a measured timing-reference accuracy bound."----
graphics::plot(seq_along(interval_ms), interval_ms, type = "h",
               col = "#24577B", xlab = "Successive observed interval",
               ylab = "Elapsed time (milliseconds)",
               main = "Nominal sampling is not realized delivery")
graphics::abline(h = nominal_ms, lty = 2, col = "#C05B43", lwd = 2)

## ----timestamp-distribution-figure, fig.width=8, fig.height=4, fig.cap="Original R histogram of intentionally jittered synthetic intervals with occasional delayed updates; no real device measurement or clock-ground-truth comparison."----
graphics::hist(interval_ms, breaks = 28,
               col = "#CEE0ED", border = "#597087",
               xlab = "Observed timestamp interval (milliseconds)",
               main = "Interval distribution reveals long-tail delays")
graphics::abline(v = nominal_ms, col = "#C05B43", lty = 2, lwd = 2)

