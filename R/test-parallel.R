################################################################################

myfun <- function(x) x * x

################################################################################

#' Use foreach
#'
#' @param x A vector.
#' @param ncores Number of cores to use.
#'
#' @return The `x` vector, squared.
#' @export
#'
#' @import foreach
#'
#' @examples
#' myfunpar(1:3, 2)
myfunpar <- function(x, ncores) {

  doParallel::registerDoParallel(cl <- parallel::makeCluster(ncores))
  on.exit(parallel::stopCluster(cl), add = TRUE)

  foreach(x_i = x) %dopar% {
    myfun(x_i)
  }
}
