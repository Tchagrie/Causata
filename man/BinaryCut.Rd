
\name{BinaryCut}
\alias{BinaryCut}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Cuts a numeric independent variable into bins.
}
\description{
A numeric independent variable is discretized and returned as a factor.  A binary
dependent variable is used to select the bins using a simple, fast algorithm based
on quantiles.
}
\usage{BinaryCut(iv, dv, nbins=10, 
  minBin=ceiling(min(table(dv))/50), 
  woeDelta=0.1, bins=FALSE, debug=FALSE)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{iv}{
  A numeric independent variable that will be cut into bins.  Missing values will be ignored during 
  binning and replaced using \code{\link{CleanNaFromFactor}}.
  }
  \item{dv}{
  The dependent variable must be an array of values with the same length as \code{iv}.  It can be numeric with only two unique values,
  or a factor with two levels.  Missing values are not allowed.
  }
  \item{nbins}{The number of bins to break \code{iv} into.  The actual number of bins returned may be lower 
  due to merging.  Must be >=2.}
  \item{minBin}{Each bin will have at least \code{minBin} values for 
  each of the classes in the binary dependent variable, 
  subject to the constraint that at least two bins are returned.
  The default is 2\% of the data in the smaller class of the dependent variable.
  Set to 0 to disable merging by counts.  Optionally, a function can be provided to calculate
  \code{minBin}.  The function must accept \code{iv} and \code{dv} 
  as the only two arguments, in that order.
  }
  \item{woeDelta}{If the absolute value of the Weight Of Evidence for adjacent 
  bins falls below this threshold, then the bins are merged.
  See \code{\link{Woe}} for more information.  Set to 0 to disable merging.}
  \item{bins}{If TRUE the breaks are returned, along with the factor, in a list.}
  \item{debug}{If TRUE debug information will be printed to the screen.}
}
\details{
This function is similar to \link{cut}, but it uses a dependent variable to inform the binning.
The algorithm is designed to be fast and simple; it is a slightly modified version of an 
equal frequency approach (quantiles).

The algorithm works as follows:
\enumerate{
  \item The independent variable is filtered to include only non-missing values, and values from the smaller class of the dependent varaible.
  \item The filtered independent variable is used to compute \code{nbins} quantiles.  
  For the special case where there are fewer unique values than bins
  the unique values are used as the quantiles.
  \item The first and last quantiles are adjusted, if necessary, to include all independent variable values
  regardless of their dependent variable class.
  \item The independent variable is cut into bins using the quantiles as boundaries.
  \item Each class of the dependent variable is counted in each bin.  
  If the count is below \code{minBin} for either class then the bin is merged with the smallest adjacent bin.  
  This merge process continues until all bins have a sufficient count of dependent variable values, 
  or until there are 2 bins left.
  \item The Weight of Evidence is calculated for each bin.  If the difference in the WOE for adjacent 
  bins falls below a threshold defined in terms of \code{woeDelta} then the bins are merged.
}
}
\value{
If \code{bins} is FALSE then a factor with up to \code{nbins} levels is returned, 
where the level names are as found from \link{cut}.  Missing values in the independent
variable are returned as missing values in the output, and are not counted as a bin.

If \code{bins} is TRUE then a list is returned with two elements:
\enumerate{
  \item{\code{fiv}} A factor representation of the independent variable, as described above.
  \item{\code{breaks}} A vector of breaks or cutpoints used to discretize the independent variable.
}
}
\author{
Justin Hemann <support@causata.com>
}
\seealso{
\code{\link{cut}, \link{Woe}.}
}
\examples{
data(df.causata)
dv <- df.causata$has.responded.mobile.logoff_next.hour_466
iv <- df.causata$online.number.of.page.views_last.30.days_3
f <- BinaryCut(iv,dv)

# compute the weight of evidence for each bin
woe <- Woe(f, dv)

# adjust plot margins to increase space for bin labels
par(oma=c(1,8,1,1)) 

# plot the bins against the weight of evidence
barplot(woe$woe.levels, names.arg=levels(f), horiz=TRUE, las=1, 
  main="Weight of Evidence for clicking a banner for a mobile app.", 
  sub="WOE vs. Page View Count, Last 30 Days" )
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
