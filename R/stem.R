
#' Stemming Malay words
#'
#' Malaytextr function to stem Malay words
#' @usage stem_malay(word,
#'   dictionary,
#'   col_feature1,
#'   col_dict1,
#'   col_dict2,
#'   Word)
#'
#' @details
#' `stem_malay()` is an approach to find the Malay words in a dictionary
#' and then proceed to remove "extra suffix" as explained by Khan et al. (2017), and then "prefix" and lastly, "suffix".
#'
#'@references
#'
#' Khan, Rehman Ullah, Fitri Suraya Mohamad, Muh Inam UlHaq, Shahren Ahmad Zadi Adruce, Philip Nuli Anding, Sajjad Nawaz Khan, and Abdulrazak Yahya Saleh Al-Hababi. 2017. "Malay Language Stemmer."
#'
#' @param word A data frame, or a character vector
#' @param dictionary A data frame with a column of words to be stemmed and a column of root words
#' @param col_feature1 Column that contains words to be stemmed from `word`
#' @param col_dict1 Column that will be used to match with `col_feature1` from `word`
#' @param col_dict2 Column that contains the root words from `dictionary`
#' @param Word Depreciated. Please use `word` instead
#'
#' @return Returns a data frame with the following properties:
#'
#'   - `Col Word`: Renamed input from `word`
#'   - `Root Word`: An additional column which contains the word(s) after being stemmed.
#'
#'
#' @examples
#'
#' #Specifying a character vector &
#' #use a dictionary from malaytextr package
#'
#' stem_malay(word = "banyaknya", dictionary = malayrootwords)
#'
#'
#'
#' #A data frame,
#' #Use a dictionary from malaytextr package,
#' #With a dataframe, you will need to specify the column to be stemmed
#'
#'x <- data.frame(text = c("banyaknya","sangat","terkedu", "pengetahuan"))
#'
#'stem_malay(word = x, dictionary = malayrootwords, col_feature1 = "text")
#'
#' @export
"stem_malay"


to_data.frame <- function(x) {

  `Col Word` = NULL

  data.frame(x) %>%
    dplyr::rename(`Col Word` = 1) %>%
    dplyr::mutate(`Col Word` = stringr::str_to_lower(`Col Word`))

}


stem_malay <- function(word, dictionary, col_feature1, col_dict1 = "Col Word", col_dict2 = "Root Word", Word) {

  UseMethod("stem_malay")

}


#' @export


stem_malay.character <- function(word, dictionary, col_feature1, col_dict1 = "Col Word", col_dict2 = "Root Word", Word) {

  #global binding

  `Root Word` = NULL

  if (!missing(Word)) {
    warning("argument Word is deprecated; please use word instead.",
            call. = FALSE)
    word <- Word
  }

  #specify suffix, infix, prefix, suffix ----

  extra_suffix = "nya$"
  infix = "^(el|em|er)"
  prefix = "^(memper|diper|ber|bel|per|ter|mem|penye|peny|menye|meny|menge|penge|meng|peng|men|pen|me|pem|pe|be|ke|se|ter|te|di)"
  suffix = "(kannya|nya|kan|an|i|kah|lah|pun|ita|man|wan|wati|ku|mu)$"

  # string to data frame ---
  word <- to_data.frame(word)

  # This is the root word variable in a dictionary ---
  col <- dplyr::sym(col_dict2)

  # Change columns in the dictionary to lowercase-format ---
  dictionary <- dplyr::mutate_all(dictionary, .funs= stringr::str_to_lower)

  # Map word to get the root word ---
  df_map <- dplyr::left_join(word, dictionary, by = c("Col Word" = rlang::as_name(col_dict1))) #map word with root word

  # To indicate which one can be found, and which not ---
  df_map <- df_map %>%
    dplyr::mutate(match = dplyr::if_else(is.na({{col}}),
                                         "NO",
                                         "YES"))

  # If word can be found, use the word from dictionary ---
  df_map <- df_map %>%
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "YES",
                                             {{col}},
                                             word %>% dplyr::pull(1))) %>%


    # If cannot be found, remove extra suffix ---
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(`Root Word`, extra_suffix),
                                             stringr::str_remove(`Root Word`, extra_suffix),
                                             `Root Word`)) %>%

    # Then remove prefix for word with more than 5 characters
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(`Root Word`, prefix) & nchar(`Root Word`) > 5,
                                             stringr::str_remove(`Root Word`, prefix),
                                             `Root Word`)) %>%

    # Then remove suffix for word with more than 5 characters
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(`Root Word`, suffix) & nchar(`Root Word`) > 5,
                                             stringr::str_remove(`Root Word`, suffix),
                                             `Root Word`))

  df_map <- df_map %>%
    dplyr::select(-c(match))

  message("'Root Word' is now returned instead of 'root_word'")

  return(df_map)
}


#' @export

stem_malay.data.frame <- function(word, dictionary, col_feature1, col_dict1 = "Col Word", col_dict2 = "Root Word", Word)  {

  #global binding

  `Root Word` = NULL
  `Col Word` = NULL

  if (!missing(Word)) {
    warning("argument Word is deprecated; please use word instead.",
            call. = FALSE)
    word <- Word
  }

  #specify suffix, infix, prefix, suffix ----

  extra_suffix = "nya$"
  infix = "^(el|em|er)"
  prefix = "^(memper|diper|ber|bel|per|ter|mem|penye|peny|menye|meny|menge|penge|meng|peng|men|pen|me|pem|pe|be|ke|se|ter|te|di)"
  suffix = "(kannya|nya|kan|an|i|kah|lah|pun|ita|man|wan|wati|ku|mu)$"


  # This is the root word variable in a dictionary ---
  col <- dplyr::sym(col_dict2)

  # Change columns to lowercase-format ---
  word <- dplyr::mutate_all(word, .funs= stringr::str_to_lower)
  dictionary <- dplyr::mutate_all(dictionary, .funs= stringr::str_to_lower)

  # Rename column
  word <- dplyr::rename(word, `Col Word` = {{ col_feature1 }})

  # Map word to get the root word ---
  df_map <- dplyr::left_join(word, dictionary, by = c("Col Word" =  rlang::as_name(col_dict1)))

  # To indicate which one can be found, and which not ---
  df_map <- df_map %>%
    dplyr::mutate(match = dplyr::if_else(is.na({{col}}),
                                         "NO",
                                         "YES"))
  # If word can be found, use the word from dictionary ---
  df_map <- df_map %>%
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "YES",
                                             {{col}},
                                             `Col Word`)) %>%

    # If cannot be found, remove extra suffix ---
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(`Root Word`, extra_suffix),
                                             stringr::str_remove(`Root Word`, extra_suffix),
                                             `Root Word`)) %>%

    # Then remove prefix for word with more than 5 characters
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(`Root Word`, prefix) & nchar(`Root Word`) > 5,
                                             stringr::str_remove(`Root Word`, prefix),
                                             `Root Word`)) %>%
    # Then remove suffix for word with more than 5 characters
    dplyr::mutate(`Root Word` = dplyr::if_else(match == "NO" &
                                               stringr::str_detect(`Root Word`, suffix) & nchar(`Root Word`) > 5,
                                             stringr::str_remove(`Root Word`, suffix),
                                             `Root Word`))

  df_map <- df_map %>%
    dplyr::select(-c(match))

  message("'Root Word' is now returned instead of 'root_word'")



  return(df_map)
}


#' @export
#' @rdname stem_malay
