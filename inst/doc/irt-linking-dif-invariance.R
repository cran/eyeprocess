## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
ref <- data.frame(item_id=paste0("I",1:8),a=seq(.8,1.5,length.out=8),b=seq(-1.5,1.5,length.out=8),c=0,d=1)
A <- 1.2; B <- -.3
foc <- ref; foc$a <- ref$a * A; foc$b <- (ref$b - B) / A
link <- eyeprocess_irt_mean_sigma_link(ref, foc)
link
eyeprocess_irt_apply_link(foc, link)

