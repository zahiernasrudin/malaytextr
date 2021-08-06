
#' Stemming Malay words
#'
#' Malaytextr function to stem Malay words
#' @usage stem_malay(Word,
#'   dictionary,
#'   by = NULL,
#'   col_feature = NULL,
#'   col_feature2 = "Root Word")
#'
#' @details
#' `stem_malay()` is an approach to find the Malay words in a dictionary
#' and then proceed to remove "extra suffix" as explained by Khan et al. (2017), and then "prefix" and lastly, "suffix".
#'
#'@references
#'
#' Khan, Rehman Ullah, Fitri Suraya Mohamad, Muh Inam UlHaq, Shahren Ahmad Zadi Adruce, Philip Nuli Anding, Sajjad Nawaz Khan, and Abdulrazak Yahya Saleh Al-Hababi. 2017. "Malay Language Stemmer."
#'
#' @param Word A data frame, or a character vector
#' @param dictionary A data frame with a column of words to be stemmed and a column of root words
#' @param by Column(s) between `Word` and `dictionary` to be used to match words.
#'
#'
#'   The same concept used in join function from dplyr package.
#'
#'   If nothing is specified, common column name between `Word` and `dictionary` will be used
#'
#'   For different column names, can be specified as `by = c("x" = "Text")`
#'
#'   "x" is a column from `Word` and "Text" is a column from `dictionary`
#'
#' @param col_feature Column that contains words to be stemmed from `Word`
#' @param col_feature2 Column that contains root words from `dictionary`
#'
#' @examples
#'
#' #Specifying a character vector &
#' #use a dictionary from malaytextr package
#'
#' stem_malay(Word = "banyaknya", dictionary = malayrootwords)
#'
#'
#'
#' #A data frame,
#' #Use a dictionary from malaytextr package,
#' #With a dataframe, you will need to specify the columns to match
#'
#'x <- data.frame(x = c("banyaknya","sangat","terkedu", "pengetahuan"))
#'
#'stem_malay(Word = x, dictionary = malayrootwords, by = c("x" = "Col Word") , col_feature = "x")
#'
#' @export
"stem_malay"


to_data.frame <- function(x) {

  `Col Word` = NULL

  tibble::as_tibble(x) %>%
    dplyr::rename(`Col Word` = 1) %>%
    dplyr::mutate(`Col Word` = stringr::str_to_lower(`Col Word`))

}


stem_malay <- function(Word, dictionary, by = NULL, col_feature = NULL, col_feature2 = "Root Word") {

  UseMethod("stem_malay")

}

#' @export


stem_malay.character <- function(Word, dictionary, by = NULL, col_feature = NULL, col_feature2 = "Root Word") {

  #global binding

  root_word = NULL

  #specify suffix, infix, prefix, suffix ----

  extra_suffix = "nya$"
  infix = "^(el|em|er)"
  prefix = "^(memper|diper|ber|bel|per|ter|mem|penye|peny|menye|meny|menge|penge|meng|peng|men|pen|me|pem|pe|be|ke|se|ter|te|di)"
  suffix = "(kannya|nya|kan|an|i|kah|lah|pun|ita|man|wan|wati|ku|mu)$"

  # string to data frame ---
  Word <- to_data.frame(Word)

  # This is the root word variable in a dictionary ---
  col <- dplyr::sym(col_feature2)

  # Change columns in the dictionary to lowercase-format ---
  dictionary <- dplyr::mutate_all(dictionary, .funs= stringr::str_to_lower)

  # Map word to get the root word ---
  df_map <- dplyr::left_join(Word, dictionary, by = by) #map word with root word

  # To indicate which one can be found, and which not ---
  df_map <- df_map %>%
    dplyr::mutate(match = dplyr::if_else(is.na({{col}}),
                                         "NO",
                                         "YES"))

  # If word can be found, use the word from dictionary ---
  df_map <- df_map %>%
    dplyr::mutate(root_word = dplyr::if_else(match == "YES",
                                             {{col}},
                                             Word %>% dplyr::pull(1))) %>%


    # If cannot be found, remove extra suffix ---
    dplyr::mutate(root_word = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(root_word, extra_suffix),
                                             stringr::str_remove(root_word, extra_suffix),
                                             root_word)) %>%

    # Then remove prefix for word with more than 5 characters
    dplyr::mutate(root_word = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(root_word, prefix) & nchar(root_word) > 5,
                                             stringr::str_remove(root_word, prefix),
                                             root_word)) %>%

    # Then remove suffix for word with more than 5 characters
    dplyr::mutate(root_word = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(root_word, suffix) & nchar(root_word) > 5,
                                             stringr::str_remove(root_word, suffix),
                                             root_word))

  df_map <- df_map %>%
    dplyr::select(-c({{col}}, match))



  return(df_map)
}


#' @export

stem_malay.data.frame <- function(Word, dictionary, by = NULL, col_feature = NULL, col_feature2 = "Root Word") {

  #global binding

  root_word = NULL

  #specify suffix, infix, prefix, suffix ----

  extra_suffix = "nya$"
  infix = "^(el|em|er)"
  prefix = "^(memper|diper|ber|bel|per|ter|mem|penye|peny|menye|meny|menge|penge|meng|peng|men|pen|me|pem|pe|be|ke|se|ter|te|di)"
  suffix = "(kannya|nya|kan|an|i|kah|lah|pun|ita|man|wan|wati|ku|mu)$"


  # Word to be stemmed ---
  col_ori <- dplyr::sym(col_feature)

  # This is the root word variable in a dictionary ---
  col <- dplyr::sym(col_feature2)

  # Change columns in the dictionary to lowercase-format ---
  Word <- dplyr::mutate_all(Word, .funs= stringr::str_to_lower)
  dictionary <- dplyr::mutate_all(dictionary, .funs= stringr::str_to_lower)

  # Map word to get the root word ---
  df_map <- dplyr::left_join(Word, dictionary, by = by)

  # To indicate which one can be found, and which not ---
  df_map <- df_map %>%
    dplyr::mutate(match = dplyr::if_else(is.na({{col}}),
                                         "NO",
                                         "YES"))
  # If word can be found, use the word from dictionary ---
  df_map <- df_map %>%
    dplyr::mutate(root_word = dplyr::if_else(match == "YES",
                                             {{col}},
                                             {{col_ori}})) %>%

    # If cannot be found, remove extra suffix ---
    dplyr::mutate(root_word = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(root_word, extra_suffix),
                                             stringr::str_remove(root_word, extra_suffix),
                                             root_word)) %>%

    # Then remove prefix for word with more than 5 characters
    dplyr::mutate(root_word = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(root_word, prefix) & nchar(root_word) > 5,
                                             stringr::str_remove(root_word, prefix),
                                             root_word)) %>%
    # Then remove suffix for word with more than 5 characters
    dplyr::mutate(root_word = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(root_word, suffix) & nchar(root_word) > 5,
                                             stringr::str_remove(root_word, suffix),
                                             root_word))

  df_map <- df_map %>%
    dplyr::select(-c({{col}}, match))



  return(df_map)
}


#' @export
#' @rdname stem_malay