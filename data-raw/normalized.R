## code to prepare `normalized` dataset goes here


normalized <- read_csv("~/Documents/data science/text mining/malaytextr/39. Malay text package/data-use/normalized.csv")

names(normalized) <- c("Col Word", "Normalized Word")

normalized %>%
  count(`Col Word`, sort = T)


usethis::use_data(normalized, overwrite = TRUE)
