## code to prepare `malayrootwords` dataset goes here

malayrootwords <- read_csv("data-raw/malayrootwords.csv")
save(malayrootwords, file="data/malayrootwords.RData")


usethis::use_data(malayrootwords, overwrite = TRUE)

