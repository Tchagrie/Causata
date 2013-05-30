\name{MergeLevels.CausataData}
\alias{MergeLevels.CausataData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Combines least-frequently occurring levels of a factor into an "Other" category.
}
\description{
\code{\link{MergeLevels}} is applied to a CausataData object, and the merge process is recorded so that it 
can be repeated during scoring.
}
\usage{
\method{MergeLevels}{CausataData}(this, variableName=NULL, max.levels, 
  other.name="Other", verbose=FALSE, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{An object from \code{\link{CausataData}}.}
  \item{variableName}{If a name is supplied then the variable matching the name will have \code{MergeLevels} applied.  
  If no name is provided then \code{MergeLevels} is applied to every factor in \code{causataData}.}
  \item{max.levels}{See \code{MergeLevels}.}
  \item{other.name}{See \code{MergeLevels}.}
  \item{verbose}{If TRUE then summary information will be printed to the screen.}
  \item{\dots}{Unused extra arguments.}
}
%\details{}
\value{
Returns an object of class \code{CausataData}.}

\author{
Justin Hemann <support@causata.com>
}

\seealso{
\code{\link{CausataData}}, \code{\link{MergeLevels}}.
}
\examples{
library(stringr)
df <- data.frame(
  f1__AP=factor(str_split("a a a b b b c c c d e f g h", " ")[[1]]), 
  f2__AP=factor(c(rep("x",7),rep("y",7))))
causataData <- CausataData(df, rep(0,nrow(df)))
# For the factor f1__AP, the levels d,e,f,g are merged into Other.
# f2__AP is not altered since it has only two levels.
causataData <- MergeLevels(causataData, max.levels=4) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ factor }
\keyword{ levels }
% __ONLY ONE__ keyword per line
