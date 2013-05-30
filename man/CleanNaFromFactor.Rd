
\name{CleanNaFromFactor}
\alias{CleanNaFromFactor}
\alias{CleanNaFromFactor.factor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Replaces missing values in a factor.
}
\description{
Missing values are replaced with the string "BLANK", or any other string supplied as an input.
}
\usage{
\method{CleanNaFromFactor}{factor}(x, replacement="BLANK", ...) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{A factor that may contain missing values.}
  \item{replacement}{Levels with missing values will be replaced with this string.}
  \item{...}{Unused arguments for other methods.}
}
\value{
Returns a factor that matches the input factor except that missing values are replaced.
}
\author{
Justin Hemann <support@causata.com>
}
\examples{
f <- as.factor(c("a","b","c",NA))
CleanNaFromFactor(f)
}