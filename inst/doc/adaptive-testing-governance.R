## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>")
library(eyeprocess)

## -----------------------------------------------------------------------------
items <- data.frame(item_id=paste0("I",1:6),a=c(.8,1,1.5,1.1,.9,1.2),b=seq(-1.5,1.5,length.out=6),c=0,d=1)
bank <- eyeprocess_irt_item_bank(items, content = c("A","A","B","B","C","C"))
eyeprocess_irt_item_selection(bank, theta = 0)
eyeprocess_irt_stopping_rule(10, se = .25)

