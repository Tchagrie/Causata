
\name{CleanNaFromContinuous.CausataData}
\alias{CleanNaFromContinuous.CausataData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Replaces missing values in an array of numeric values in a CausataData object.
}
\description{
Missing values are replaced in a \code{CausataData} object, and the process is recorded so that it can be reapplied
during scoring.
}
\usage{
\method{CleanNaFromContinuous}{CausataData}(x, variableName=NULL, method="median", ...)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object of class \code{CausataData}.}
  \item{variableName}{If a name is supplied then the variable matching the name will have \code{CleanNaFromContinuous} applied.  
  If no name is provided then \code{CleanNaFromContinuous} is applied to every continuous variable in \code{causataData}.}
  \item{method}{See \code{CleanNaFromContinuous}.}
  \item{...}{Unused arguments for other methods.}
}
\details{
The default behavior is that missing numeric values are replaced with the median.}
\value{
Returns a \code{CausataData} object.
}
\author{
Justin Hemann <support@causata.com>
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{CleanNaFromContinuous}}, \code{\link{CausataData}}.
}
\examples{
# median of x__AP is 2
df <- data.frame(x__AP=c(NA, 1,1.5,2,3,11), y__AP=c(NA, 1,2,3,4,5))
causataData <- CausataData(df, rep(0, nrow(df)))
causataData <- CleanNaFromContinuous(causataData)
}
