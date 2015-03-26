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
#'
#' \code{upipe}'s default method coerces \code{input} to character before sending
#' it to the system command.  Other methods are specific to the data object.
#' Currently the only implemented method is \code{upipe.data.frame}, which converts
#' data frames to CSV format before piping them.
#'
#' @usage  upipe(input, command, show_stderr = interactive(), ...)
#'
#' input \%>\% upipe(command)
#'
#' @param input a character string to send to the shell. Elements will be separated
#' by newlines.
#' @param command a system command to take \code{input} as stdin
#' @param show_stderr print stderr of the command to the console as a message?
#' @param arguments to specific methods.
#'
#' @export
upipe <- function(input, command, show_stderr = interactive(), ...) {
  UseMethod("upipe")
}

#' @importFrom magrittr %>%
#' @name %>%
#' @export
#' @rdname upipe
NULL
