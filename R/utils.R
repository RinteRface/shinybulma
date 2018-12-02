drop_nulls <- function(x) {
  x[!vapply(x, is.null, FUN.VALUE=logical(1))]
  on.exit(env[[name]] <- orig)
  
  force(expr)
}