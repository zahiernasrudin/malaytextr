## code to prepare `malayrootwords` dataset goes here

library(readr)
library(dplyr)

malayrootwords <- read_csv("G:/My Drive/1. Zahier Projects/13. malaytextr/data-raw/malayrootwords.csv")

malayrootwords %>%
  count(`Col Word`, sort = T)

usethis::use_data(malayrootwords, overwrite = TRUE)
