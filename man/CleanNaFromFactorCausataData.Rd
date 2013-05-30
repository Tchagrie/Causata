
\name{CleanNaFromFactor.CausataData}
\alias{CleanNaFromFactor.CausataData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Given a factor in a CausataData object, this replaces missing values.
}
\description{
Missing values are replaced with the string "BLANK", or any other string supplied as an input.
}
\usage{
\method{CleanNaFromFactor}{CausataData}(x, variableName=NULL, replacement="BLANK", ...) }
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object from \code{CausataData}.}
  \item{variableName}{If a name is supplied then the variable matching the name will have \code{CleanNaFromFactor} applied.  
  If no name is provided then \code{CleanNaFromFactor} is applied to every factor in \code{causataData}.}
  \item{replacement}{Levels with missing values will be replaced with this string.}
  \item{...}{Unused arguments for other methods.}
}
%\details{
%}
\value{
Returns a \code{CausataData} object with the missing value replacements recorded.
}

\author{
Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CleanNaFromFactor}}, \code{\link{CausataData}}.
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
df <- data.frame(f1__AP=factor(c("a","b",NA)), f2__AP=factor(c("x","y",NA)))
causataData <- CausataData(df, rep(0,nrow(df)))
causataData <- CleanNaFromFactor(causataData)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
