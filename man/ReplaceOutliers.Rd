
\name{ReplaceOutliers}
\alias{ReplaceOutliers}
\alias{ReplaceOutliers.numeric}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Replaces outliers in a continuous variable.
}
\description{
Given a vector of integer or numeric values, outliers exceeding user-defined limits are replaced.
}
\usage{
\method{ReplaceOutliers}{numeric}(this, lowerLimit=NULL, upperLimit=NULL, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{
  An array of numeric values.  Missing values will be ignored and retained.
  }
  \item{lowerLimit}{
  If a value is provided then values less than this in \code{this} will be replaced with the value of \code{lowerLimit}.
  }
  \item{upperLimit}{
  If a value is provided then values greater than this in \code{this} will be replaced with the value of \code{upperLimit}.
  }
  \item{\dots}{Extra unused arguments.}
}
\details{
A new array is returned with outliers replaced with limit values.  
Any value that is less than \code{lowerLimit} or greater than \code{upperLimit} is 
considered an outlier.  Missing values are ignored.
}
\value{
An array with outliers replaced. 
}

\author{
Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%\code{\link{cut}}.
%}
\examples{
ReplaceOutliers(c(-1000, 1, 2, 3, NA, 1000), lowerLimit=1, upperLimit=3)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
