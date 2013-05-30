
\name{CleanNaFromContinuous}
\alias{CleanNaFromContinuous}
\alias{CleanNaFromContinuous.numeric}
\alias{CleanNaFromContinuous.POSIXct}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Replaces missing values in an array of numeric values.
}
\description{
Replaces missing values in an array of numeric values.
}
\usage{
\method{CleanNaFromContinuous}{numeric}(x, method="median", replacement.value=NULL, 
  return.replacement=FALSE, ...)
  
\method{CleanNaFromContinuous}{POSIXct}(x, method="median", replacement.value=NULL, 
  return.replacement=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An array of numerical (continuous) values and missing values.}
  \item{method}{Sets the method used to replace missing values.  Valid values are "median" and "mean".}
  \item{replacement.value}{If this argument is not NULL then missing values will be replaced with the value provided
  instead of a mean or median.}
  \item{return.replacement}{If FALSE then an array is returned with missing values replaced.  
  If TRUE then a list is returned with the array and 
  the replacement value.}
  \item{...}{Unused arguments for other methods.}
}
\details{
The default behavior is that missing numeric values are replaced with the median.}
\value{
Returns an array with missing values replaced.  Optionally a list can be returned with the array and the replacement value.
}
\author{
Justin Hemann <support@causata.com>
}
\examples{
# numeric, median is 2, mean is 3.7
x <- c(NA, 1,1.5,2,3,11)
CleanNaFromContinuous(x)
}
