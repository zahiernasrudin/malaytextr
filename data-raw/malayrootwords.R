## code to prepare `malayrootwords` dataset goes here

library(readr)
malayrootwords <- read_csv("G:/My Drive/1. Zahier Projects/13. malaytextr/data-raw/malayrootwords.csv")

usethis::use_data(malayrootwords, overwrite = TRUE)
