## code to prepare `malaysia_politic_sentiment` dataset goes here

library(readr)
library(dplyr)
library(stringr)

malaysia_politic_sentiment <- read_csv("~/Documents/data science/text mining/malaytextr/data_use/malaysia_politic_sentiment.csv")

usethis::use_data(malaysia_politic_sentiment, overwrite = TRUE)
