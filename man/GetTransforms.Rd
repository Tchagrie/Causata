
\name{GetTransforms}
\alias{GetTransforms}
\alias{GetTransforms.CausataData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{GetTransforms}
\description{
Returns a function that will re-apply the transformations that have been applied to a CausataData obejct to another data frame.
}
\usage{
\method{GetTransforms}{CausataData}(this, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{A \code{\link{CausataData}} object.}
  \item{\dots}{Unused extra arguments.}
}
\details{
As transformations are applied to the CausataData object, they are recorded.
This function returns a function that will apply these transformations, 
in order, as they were applied to the data frame in the CausataData object.  
This can be used to validate that transformations work as expected on new data, and are used in model validation.
}
\value{
A function that accepts a data.frame as an argument and returns a transformed data.frame.
}
\author{
David Barker (support@causata.com)
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataData}}.
}
\examples{
# Create a data frame with a factor that has 5 levels.
df <- data.frame(var__AP=c("a", "a", "a",  "b", "b",  "c", "d", "e", NA))
caustaData <- CausataData(df, rep(0,nrow(df)))

# Merge the smaller levels so the factor has 3 levels.
# The remaining levels will be a, b, and Other.
caustaData <- MergeLevels(caustaData, max.levels=3)

# Get a function that will re-apply any transformations in caustaData.
transformer <- GetTransforms(caustaData)

# Now, create a new data.frame and apply the same transformation to it.  
# Any levels in the factor that are not "a", or "b" will be replaced 
# with "Other"
new.df <- data.frame(var__AP=c("a", "b", "c", "c", "c", "d", "a", NA))
transformed.df <- transformer(new.df)
transformed.df$var__AP
}