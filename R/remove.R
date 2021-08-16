#' Remove URL links
#'
#' @usage remove_url(string)
#' @details
#' `remove_url()` is an approach to remove link(s) from a string
#'
#'
#' @param string String to change
#'
##' @return Returns a string with URL links removed
#'
#' @export
#'
#' @examples
#' x <- c("test https://t.co/fkQC2dXwnc", "another one https://www.google.com/ to try")
#' remove_url(x)


remove_url <- function(string) {

  stringr::str_remove_all(string, "(http[^ ]*)|(www.[^ ]*)|(https?://t\\.co[^ ]*)|(t\\.co[^ ]*)")


}


