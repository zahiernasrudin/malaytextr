## code to prepare `sentiment_general` dataset goes here

library(tidyverse)

sentiment_general <- read_csv("~/Documents/data science/text mining/malaytextr/data_use/sentiment_general.csv")


sentiment_general %>%
  count(Word, sort = T)


usethis::use_data(sentiment_general, overwrite = TRUE)
