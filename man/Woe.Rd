
\name{Woe}
\alias{Woe}
\alias{Woe.factor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Weight of evidence for each level of a factor.
}
\description{
Computes the weight of evidence for each level of a factor and a dependent variable.
}
\usage{
\method{Woe}{factor}(iv, dv, maxOdds=10000, civ=NULL, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{iv}{
  A factor, the independent variable.  Missing values, if present, are replaced using \code{CleanNaFromFactor}.
  }
  \item{dv}{
  The dependent variable, which may have only two unique values.  Missing values are not allowed.  
  }
  \item{maxOdds}{When the odds are greater than \code{maxOdds} or less than \code{1/maxOdds} then the
  odds are replaced with the threshold value.}
  \item{civ}{If \code{iv} is a discretized version of a continuous variable, then the original continuos 
  variable can be provided in this argument so that linearity can be calculated.  See the Value section below for more information.}
  \item{\dots}{Extra unused arguments.}
}
\details{
This function computes the log odds (aka weight of evidence) for each level in a factor as follows:
\deqn{woe = \log \frac{nPositive}{nNegative}}
where \code{nPositive} is the number of "positive" values in the dependent variable, and \code{nNegative} is the number of "negative" values.

By default the second level of \code{dv} is used as the "positive" class during power calculations.  This can
be controlled by ordering the levels in a factor supplied as \code{dv}.

Other metrics returned include the information value and the log density ratio.
}
\value{
A list with the following elements:
\item{woe.levels }{A vector of WOE values corresponding to each level of the factor \code{iv}.  The values are ordered to match the input factor \code{iv}.}
\item{woe }{A vector of WOE values with the same length as \code{iv}.  Essentially each factor value is replaced with the associated log odds.}
\item{odds }{A vector of odds values corresponding to each level of the factor \code{iv}.  
The values are ordered to match the input factor \code{iv}.}
\item{bin.count }{A count of data points in each level of the factor \code{iv}.}
\item{true.count }{A count of "true" dependent variable values in each level of the factor \code{iv}.  
  The number of "false" values is \code{bin.count - true.count}.}
\item{log.density.ratio }{A vector of log density ratio values corresponding to each level of the factor \code{iv}.  
The values are ordered to match the input factor \code{iv}.}
\item{information.value }{A vector of information values corresponding to each level of the factor \code{iv}.  
The values are ordered to match the input factor \code{iv}.}
\item{linearity }{A measure of correlation 
  between the log-odds of the dependent variable and the binned values of the continuous independent variable \code{civ}.
  This is calculated if the \code{civ} argument was provided, otherwise it's NA.}
}

\author{
Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CleanNaFromFactor}}.
}
\examples{
library(stringr)

# create a factor with three levels
# - odds of 1 for a:  1:2 = 2.0
# - odds of 1 for b:  2:1 = 0.5
# - odds of 1 for NA: 1:1 = 1.0
f1  <- factor(c(str_split("a a a b b b", " ")[[1]], NA,NA))
dv1 <- c(                  1,1,0,0,0,1,              1, 0 )
fw1 <- Woe(f1,dv1)
fw1$odds

# discretize a continuous variable into a factor with 10 levels and compute WOE,
data(df.causata)
dv <- df.causata$has.responded.mobile.logoff_next.hour_466
f2 <- BinaryCut(df.causata$online.average.authentications.per.month_all.past_406, dv)
fw2 <- Woe(f2, dv, civ=df.causata$online.average.authentications.per.month_all.past_406)
fw2$odds
fw2$linearity
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
