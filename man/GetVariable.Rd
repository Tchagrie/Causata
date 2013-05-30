
\name{GetVariable.CausataData}
\alias{GetVariable}
\alias{GetVariable.CausataData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Get the CausataVariable for the named variable
}
\description{
Returns the CausataVariable object for the given column in a CausataData object. 
The name passed in must match a column name in the \code{CausataData$df} data frame.
}
\usage{
\method{GetVariable}{CausataData}(this, r.name=NULL, \dots)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{A CausataData object.}
  \item{r.name}{A column name in the \code{CausataData$df} data frame.}
  \item{\dots}{Unused extra arguments.}
}
%\details{
%}
\value{
The CausataVariable object for the given column,
or NULL if there is no such column.
}

\author{
David Barker <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataData}}, \code{\link{CausataVariable}}, \code{\link{CausataToRNames}}, \code{\link{RToCausataNames}}.
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% __ONLY ONE__ keyword per line
