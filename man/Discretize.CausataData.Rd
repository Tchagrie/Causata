\name{Discretize.CausataData}
\alias{Discretize.CausataData}
\alias{Discretize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Discretizes a continous variable in a CausataData object.
}
\description{
Discretize a continuous variable in a \code{CausataData} object, and record the process so that it can be reapplied during scoring.
}
\usage{
\method{Discretize}{CausataData}(this, variableName, breaks, discrete.values, verbose=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{An object from \code{CausataData}.}
  \item{variableName}{The name of the numeric \code{CausataVariable} to discretize.}
  \item{breaks}{A numeric vector of two or more cut points.  This is used by \code{cut} to discretize the variable.  
  See \emph{Details} below for more information.}
  \item{discrete.values}{A numeric vector of discrete values that the continuous values will replaced with.  
  See \emph{Details} below for more information.}
  \item{verbose}{If \code{TRUE} then binning information is printed to the console.}
  \item{...}{Unused arguments for other methods.}
}
\details{
This function uses \code{cut} to discretize the variable; it is called with \code{include.lowest=TRUE} and \code{right=TRUE}.
If \emph{N} discrete bins are desired then \code{breaks} should have \emph{N+1} values for cut points.

Missing values are permitted, they will be mapped to a separate bin during discretization.  
This arrangement has three important conditions:

First, missing values must \emph{not} be replaced 
(as in \code{CleanNaFromContinous}).  Executing \code{Discretize} on a variable that was treated 
with \code{CleanNaFromContinous} will generate an error.

Second, \code{ReplaceOutliers} must be executed \emph{before} \code{Discretize}, and the upper limit must be
less than or equal to the last \code{breaks} value.  
Missing values are mapped to an artificial bin that is greater than the last value of \code{breaks}.
Using \code{ReplaceOutliers} ensures that outliers are mapped to the existing values and not the missing values.

Third, if missing values are present in the variable and there are 
\emph{N} bins, then \emph{N+1} \code{discrete.values} are required.  
By convention missing values are mapped to the last value of \code{discrete.values}.
}
\value{
Returns a \code{CausataData} object.
}
\author{
Justin Hemann <support@causata.com>.
}
\seealso{
\code{\link{CausataData}}, \code{\link{CausataVariable}}, \code{\link{cut}}, \code{\link{CleanNaFromContinuous}}, \code{\link{ReplaceOutliers}}.
}
\examples{
# create a random variable and a dependent variable
set.seed(1234)
ivn <- rnorm(1e5) # random data, normally distributed, no missing values
ivm <- ivn  # create a copy, but replace the first 100 values with NA (missing)
ivm[1:100] <- NA
dvn <- rep(0, 1e5)
dvn[(ivn + rnorm(1e5, sd=0.5))>0] <- 1
causataData <- CausataData(data.frame(ivn__AP=ivn, ivm__AP=ivm), dependent.variable=dvn)

# plot data before discretization
hist(causataData$df$ivn__AP, main="Before discretization.", col="gray")

# the replace outliers step is required
causataData <- ReplaceOutliers(causataData, 'ivn__AP', 
  lowerLimit=min(causataData$df$ivn__AP), 
  upperLimit=max(causataData$df$ivn__AP))

# discretize with deciles, 1st decile is mapped to 1, 2nd to 2, etc.
breaks <- quantile(ivn, probs=seq(0,1,0.1))
causataData <- Discretize(causataData, 'ivn__AP', breaks, 1:10, verbose=TRUE)

# plot data after discretization
hist(causataData$df$ivn__AP, main="After discretization.", col="gray", breaks=seq(0.5,10.5,1))

# Discretize data where missing values are present.  
# One extra value is required for discrete.values, map missing to 0.
# By convention missing values are mapped to the last element in discrete.values
causataData <- ReplaceOutliers(causataData, 'ivm__AP', 
  lowerLimit=min(causataData$df$ivm__AP, na.rm=TRUE),
  upperLimit=max(causataData$df$ivm__AP, na.rm=TRUE))
causataData <- Discretize(causataData, 'ivm__AP', breaks, c(1:10,0), verbose=TRUE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.