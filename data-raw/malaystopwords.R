## code to prepare `malaystopwords` dataset goes here

library(readr)
library(dplyr)

malaystopwords <- read_csv("G:/My Drive/1. Zahier Projects/13. malaytextr/data-raw/malaystopwords.csv")

malaystopwords %>%
  count(stopwords, sort = T)

usethis::use_data(malaystopwords, overwrite = TRUE)
