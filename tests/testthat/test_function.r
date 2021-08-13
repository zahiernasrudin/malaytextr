library(testthat)
library(malaytextr)

# For character vector

test_that("stem_malay() returns a data frame when character vector is used", {
  output_table <- stem_malay(Word = "banyaknya", dictionary = malayrootwords)
  expect_s3_class(output_table, "data.frame")
})


# For a data frame input

test_that("stem_malay() returns a data frame when a data frame is used", {
  x <- data.frame(text = c("banyaknya","sangat","terkedu", "pengetahuan"))

  output_table <-  stem_malay(Word = x, dictionary = malayrootwords, col_feature1 = "text")
  expect_s3_class(output_table, "data.frame")
})



# Check if it removes urls

test_that("remove_url() removes urls", {

  x <- c("another one https://www.google.com/ to try")
  y <- remove_url(x)

  expect_equal(y, "another one  to try")
})




