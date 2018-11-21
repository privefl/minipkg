#' Render an Rmd file
#' @param rmd Path of the R Markdown file to render.
#' @export
my_render <- function(rmd) {
  rmarkdown::render(
    rmd,
    "all",
    envir = new.env(),
    encoding = "UTF-8"
  )
}
