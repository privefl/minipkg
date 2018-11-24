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

#' Render an Rmd file
#' @param rmd Path of the R Markdown file to render.
#' @export
my_render2 <- function(rmd) {
  cl <- parallel::makePSOCKcluster(1)
  on.exit(parallel::stopCluster(cl), add = TRUE)
  parallel::clusterExport(cl, "rmd", envir = environment())
  parallel::clusterEvalQ(cl, {
    rmarkdown::render(rmd, "all", encoding = "UTF-8")
  })[[1]]
}

