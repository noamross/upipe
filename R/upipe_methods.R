#' @export
upipe.data.frame <- function(input, command, show_stderr = interactive(), ...) {

  if (!is.logical(show_stderr) || is.na(show_stderr))
    stop("'show_stderr' must be TRUE or FALSE")

  if (!is.data.frame(input)) {
    stop("'input' must be a data frame")
  }

  if (!show_stderr) {
    command <- paste(command, "2>/dev/null")
  }


  fifo_in_name <- tempfile()
  fifo_in <- fifo(fifo_in_name)

  on.exit({
    close(fifo_in)
    unlink(fifo_in_name)
  })

  write.csv(input, fifo_in_name, ...)

  command <- paste("(", command, ") <", shQuote(fifo_in_name))

  system(command = command, intern = TRUE, ignore.stderr = !show_stderr,
         wait = TRUE, input = NULL)  #or should we use pipe()?
}

#' @export
upipe.default <- function (input, command, show_stderr = interactive(), ...) {

  input <- as.character(input, ...)

  if (!is.logical(show_stderr) || is.na(show_stderr))
    stop("'show_stderr' must be TRUE or FALSE")

  if (!is.character(input)) {
    stop("'input' must be a character vector")
  }

  if (!show_stderr) {
    command <- paste(command, "2>/dev/null")
  }


  fifo_in_name <- tempfile()
  fifo_in <- fifo(fifo_in_name)
  on.exit({
    close(fifo_in)
    unlink(fifo_in_name)
  })

  writeLines(input, fifo_in_name)

  command <- paste("(", command, ") <", shQuote(fifo_in_name))

  system(command = command, intern = TRUE, ignore.stderr = !show_stderr,
         wait = TRUE, input = NULL)  #or should we use pipe()?
}
