## code to prepare `malayrootwords` dataset goes here

library(readr)
library(dplyr)

malayrootwords <- read_csv("~/Documents/data science/text mining/malaytextr/39. Malay text package/data-use/malayrootwords.csv")

malayrootwords %>%
  count(`Col Word`, sort = T)

usethis::use_data(malayrootwords, overwrite = TRUE)
