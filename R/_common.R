
# ------------------------------------------------------------------------------
# formatting for package names


pkg <- function(x, cran = TRUE) {
  cl <- match.call()
  x <- as.character(cl$x)
  pkg_chr(x, cran = cran)
}

pkg_chr <- function(x, cran = TRUE) {
  if (cran) {
    res <- glue::glue('<span class="pkg"><a href="https://cran.r-project.org/package={x}">{x}</a></span>')
  } else {
    res <- glue::glue('<span class="pkg">{x}</span>')
  }
 res 
}
  

pkg_list <- function(x) {
  x <- unique(x)
  n <- length(x)
  x <- x[order(tolower(x))]
  x <- purrr::map_chr(x, ~ pkg_chr(.x))
  y <- knitr::combine_words(x)
  
  req <- cli::pluralize("{n} package{?s}: {y}")
  req
}

# ------------------------------------------------------------------------------
