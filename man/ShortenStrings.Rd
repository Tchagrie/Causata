\name{ShortenStrings}
\alias{ShortenStrings}
\title{Shortens strings by replacing the middle with a separator.}
\description{
Strings are shortened by replacing characters from the middle
of the string with a separator.
}
\usage{
ShortenStrings(strings, max.len=40, end.len=floor(max.len/2), sep='...')
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{strings }{A string of characters, or an array of strings.}
  \item{max.len }{The maximum length of the string.  Must be at least \code{1+str_length(sep)}.}
  \item{end.len }{The length of the string retained after the separator.}
  \item{sep }{A separator that will be used to replace the middle of the string.}
}
\details{
If the input string is longer than \code{max.len}, then the string is shortened as follows.
First, leading and trailing whitespace is removed.  If the string is still longer
than \code{max.len} then a start length is computed as:

\code{start.len = max.len - end.len - str_length(sep)}

Characters after \code{start.len} and before \code{end.len} are replaced with \code{sep}.
If \code{end.len} is too large (as in the third example below) then it is silently
reset to the largest allowable value given \code{sep} and \code{max.len}.
}
\value{
A single string or an array of strings with the same length as \code{strings}.
}
\author{
Justin Hemann <support@causata.com>
}
\seealso{\code{\link{abbreviate}}.}
\examples{
# only leading / trailing whitespace is removed
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=26)

# the middle is replaced with ...
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=20)

# the beginning is replaced with ...
# note that end.len is too long, it is silently set to 17 here.
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=20, end.len=20)

# the end is replaced with ...
ShortenStrings(' abcdefghijklmnopqrstuvwxyz ', max.len=20, end.len=0)
}