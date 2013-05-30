\name{PredictivePower}
\alias{PredictivePower}
\alias{PredictivePower.factor}
\alias{PredictivePower.numeric}
\alias{PredictivePowerCv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Predictive power for a single variable.
}
\description{
This function computes predictive power for a single independent variable and a binary dependent variable.
}
\usage{
\method{PredictivePower}{factor}(iv, dv, warn.levels=30, cv=NULL, debug=FALSE, \dots)

\method{PredictivePower}{numeric}(iv, dv, warn.levels=30, cv=NULL, debug=FALSE, \dots)

PredictivePowerCv(iv, dv, warn.levels=30, debug=FALSE, folds=10, \dots)
}
\arguments{
  \item{iv}{The independent variable.}
  \item{dv}{The dependent variable, which may have only two unique values.}
  \item{warn.levels}{If the number of levels in \code{iv} exceeds this value then a warning will be issued.}
  \item{debug}{If set to \code{TRUE} then debugging information is printed to the screen.}
  \item{cv}{If \code{NULL} then all data are used to compute the predictive power.  If an index of boolean 
    values is provided then they are used to separate the data into two parts for cross validation.  See
    the Details below for more information.}
  \item{\dots}{Additional arguments are passed to \code{BinaryCut}.}
  \item{folds}{This argument is used to specify the folds used for cross validation.  
    If a number between 2 and 10 is provided then data will be assigned to the selected number of folds at
    random.  If a vector of values is provided then it will be used as an index to assign data to folds.  
    The number of unique values must be between 2 to 10, and the vector length must match \code{iv}.}
}
\details{
Predictive power is defined as the area under the gains chart for the provided independent variable divided by
the area under the gains chart for a perfect predictor.  A random predictor would have a predictive power value
of 0, and a perfect predictor would have a value of 1.

The power calculation is derived from a discretized gains chart.  As such it only works with categorical variables.
Numeric variables are discretized before power is computed.  
The \code{PredictivePower.numeric} function discretizes continuous data using the \code{BinaryCut} function.
Note that the predictive power will depend, in part, on the discretization method.

By default the second level of \code{dv} is used as the "positive" class during power calculations.  This can
be controlled by ordering the levels in a factor supplied as \code{dv}.

Missing values in \code{iv} are allowed in \code{PredictivePower.factor} -- 
they are ignored during the calculations, as are the corresponding 
dependent variable values.  The missing values can be used in the power calculations if the missing values
are mapped to a non-missing level in the factor.  See \code{CleanNaFromFactor}.
Missing values are not allowed in \code{dv}.

Cross validation is executed using the \code{PredictivePowerCv} function as a wrapper for the 
\code{PredictivePower} functions.  When constructing the gains chart the bins are ordered by the odds for 
a "positve" within each bin.  During cross validation the ordering is derived from one set of data, and
the area under the curve is calculated with the other set.
}
\value{
The \code{PredictivePower} functions returns a numeric value representing the predictive power, between 0 and 1.

\code{PredictivePowerCv} returns a list as follows:

\item{predictive.power}{An array of predictive power values, one for each fold of cross validation.}
\item{mean}{The mean predictive power value.}
\item{sd}{The standard deviation of predictive power values.}
\item{robustness}{A measure of stability defined as \code{1-sd/mean}.  
  Values will be between zero (unstable) and 1 (stable).}
}
\references{
Inspired by Miller, H. (2009) \emph{Predicting customer behaviour: The University of Melbourne's KDD Cup report}.}
\author{
Justin Hemann <support@causata.com>}

\seealso{
\code{\link{CleanNaFromFactor}}, \code{\link{BinaryCut}}.
}
\examples{
library(stringr)

# Power is 1/3 where levels differ by 1/3, missing values in iv are ignored.
PredictivePower(factor(c(str_split("a a a b b b", " ")[[1]], NA,NA)),
              c(                    1,1,0,0,0,1,              1, 1 ) )

# Power is 1.0 for perfect predictor
PredictivePower(factor(c(str_split("a a a a a b b b b b", " "))[[1]]),
                factor(c(str_split("1 1 1 1 1 0 0 0 0 0", " "))[[1]]) )

# Power is 0 for random predictor
PredictivePower(factor(c(str_split("a a a a b b b b", " "))[[1]]),
                factor(c(str_split("1 1 0 0 1 1 0 0", " "))[[1]]) )

# compute power for random data, power and robustness should be low
set.seed(1234)
fl <- as.factor(sample(letters, size=1e5, replace=TRUE))
dv <- sample(c(0,1), size=1e5, replace=TRUE)
PredictivePowerCv(fl,dv)

# compute power for numeric data, send nbins arguments to BinaryCut
ivn <- rnorm(1e5)
dvn <- rep(0, 1e5)
dvn[(ivn + rnorm(1e5, sd=0.5))>0] <- 1
PredictivePower(ivn,dvn, nbins=10)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.