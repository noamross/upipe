# Some brainstorming ideas
# Use fifo/named pipes for this
# Everything in R is already in memory, so why do this?
#    - avoid writing to disk
# Fit into %>% workflow
# Auto conversion of types?
# Methods: data frames --> CSV, lists --> JSON (jsonlines?), otherwise as.character?


#' Pipe through system shell
#'
#' \code{upipe} is a modification to \code{\link[base]{system}} designed for
#' piping data out of R, into the shell, and returning back to an R analysis pipeline

#' Take in a text object, run it through a unix command, return it
#'
#' @usage  upipe(input, command, show_stderr = interactive())
#'
#' input \%>\% upipe(command)
#'
#' @param input a character string to send to the shell. Elements will be separated
#' by newlines.
#' @param command a system command to take \code{input} as stdin
#' @param show_stderr print stderr of the command to the console as a message?
#'
#' @export
upipe <- function (input, command, show_stderr = interactive()) {

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

  system(command = command, intern = TRUE, ignore.stderr = !show_stderr, wait = TRUE,
        input = input)  #or should we use pipe()?
}

#' @importFrom magrittr %>%
#' @name %>%
#' @export
#' @rdname upipe
NULL

