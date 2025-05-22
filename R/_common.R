
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

  req <- cli::pluralize("You’ll need {n} package{?s} ({x}) for this chapter. 
                         You can install {?it/them} via:")
  req
}

# ------------------------------------------------------------------------------

back <- function(stub) {
  glue::glue(
    '<a href="https://aml4td.org/chapters/[stub]" >{{< fa solid rotate-left size=small >}}</a>',
    .open = "[", .close = "]"
  )
}

# ------------------------------------------------------------------------------

dl_pkgs <- 
  c("bestNormalize", "bonsai", "broom", "colino", "dials", "dplyr", 
    "embed", "finetune", "future", "GA", "ggplot2", "janitor", "naniar", 
    "parsnip", "partykit", "patchwork", "probably", "purrr", "recipes", 
    "rsample", "rules", "rules", "sf", "spatialsample", "textrecipes", 
    "tibble", "tidymodels", "tidyr", "tidysdm", "tune", "workflows", 
    "workflowsets", "yardstick")

downlit:::add_depends(dl_pkgs)

