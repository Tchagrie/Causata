
\name{ReplaceOutliers.CausataData}
\alias{ReplaceOutliers.CausataData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Replace outliers in a CausataData object.
}
\description{
Outliers are replaced in a CausataData object, and the limits are stored
so that they can be re-applied when scoring.
}
\usage{
\method{ReplaceOutliers}{CausataData}(this, variableName, 
  lowerLimit=NULL, upperLimit=NULL, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{
    A \code{\link{CausataData}} object.
  }
  \item{variableName}{
    The name of the variable within the causataData object that will have outliers replaced.
  }
  \item{lowerLimit}{See \code{\link{ReplaceOutliers}}.}
  \item{upperLimit}{See \code{\link{ReplaceOutliers}}.}
  \item{\dots}{Extra unused arguments.}
}
%\details{
%}
\value{
Returns a \code{\link{CausataData}} object.
}

\author{
Justin Hemann <support@causata.com>
}
%\note{
  %%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~
  
\seealso{
\code{\link{CausataData}}, \code{\link{CausataVariable}}, \code{\link{ReplaceOutliers}}.
}
\examples{
df <- data.frame(variable1__All.Past=c(1,2,3,4,1000))
# create CausataData object
causataData <- CausataData(df, rep(0,nrow(df)))
# max is 1000 before outliers are replaced
max(causataData$df$variable1__All.Past) 
causataData <- ReplaceOutliers(causataData, 'variable1__All.Past', upperLimit=4)
# now max is 4 after outliers are replaced
max(causataData$df$variable1__All.Past) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% __ONLY ONE__ keyword per line
