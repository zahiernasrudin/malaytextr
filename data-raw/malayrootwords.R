## code to prepare `malayrootwords` dataset goes here

library(readr)
library(dplyr)
library(stringr)

malayrootwords <- read_csv("~/Documents/data science/text mining/malaytextr/data_use/malayrootwords.csv")

malayrootwords <- malayrootwords %>%
  mutate(`Col Word` = str_to_lower(`Col Word`),
         `Root Word` = str_to_lower(`Root Word`))

malayrootwords %>%
  count(`Col Word`, sort = T)

usethis::use_data(malayrootwords, overwrite = TRUE)
