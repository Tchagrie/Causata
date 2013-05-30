
\name{GrepLoop}
\alias{GrepLoop}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Searches for a list of patterns within a list of strings.
}
\description{
Given a vector of patterns and a vector of strings, this searches for the patterns within the strings and returns the
matching locations.}
\usage{
GrepLoop(patternVec, x, ignore.case=TRUE, boolean=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{patternVec}{A vector of pattern strings to search for.}
  \item{x}{A vector of strings to search through using \code{\link{grep}}.}
  \item{ignore.case}{Indicates if the matches are case-sensitive.}
  \item{boolean}{Controls whether an index of integers or booleans is returned.}
}
\details{
This function applies \code{\link{grep}} multiple times.
}
\value{
A vector of indices indicating which elements in \code{x} match any of the patterns in \code{patternVec}.
}
\author{Justin Hemann <support@causata.com>}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{grep}}.
}
\examples{
pats <- c("gray", "grey")
x <- c("dark gray", "yellow", "light grey", "red")
# The first and third elements in x match the patterns
GrepLoop(pats, x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
