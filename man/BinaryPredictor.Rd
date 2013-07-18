\name{BinaryPredictor}
\alias{BinaryPredictor}
\alias{BinaryPredictor.factor}
\alias{BinaryPredictor.numeric}
\alias{BinaryPredictor.data.frame}
\alias{BinaryPredictor.default}
\alias{plot.BinaryPredictor}
\alias{print.BinaryPredictorList}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Univariate analysis for binary classification.}
\description{
An independent variable is evaluated as a predictor for a binary dependent variable.  The 
independent variable may be numeric, a factor, or a data frame containing numeric 
and factor columns.
}
\usage{
\method{BinaryPredictor}{factor}(iv, dv, min.power=0.01, min.robustness=0.5, 
  max.missing=0.99, max.levels=20, civ=NULL, copy.data=FALSE, name=NULL, \dots)
  
\method{BinaryPredictor}{numeric}(iv, dv, min.power=0.01, min.robustness=0.5, 
  max.missing=0.99, copy.data=FALSE, name=NULL, \dots)
  
\method{BinaryPredictor}{data.frame}(iv, dv, min.power=0.01, min.robustness=0.5, 
  max.missing=0.99, verbose=FALSE, copy.data=FALSE, \dots)

\method{BinaryPredictor}{default}(iv, dv, \dots)

\method{plot}{BinaryPredictor}(x, y=NULL, type="bin", plot.missing=TRUE, \dots)

\method{print}{BinaryPredictorList}(x, file=NULL, silent=FALSE, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{iv}{The independent variable(s).  May be a factor, numeric, or a data frame.}
  \item{dv}{The dependent variable, which may have only two unique values.  
  The length / number of rows in \code{iv} must match the length of \code{dv}.}
  \item{min.power}{The minimum predictive power from \code{PredictivePowerCv} 
  for a variable to be kept.}
  \item{min.robustness}{The minimum robustness from \code{PredictivePowerCv} 
  for a variable to be kept.}
  \item{max.missing}{The maxmimum allowable fraction of missing values for a variable to be kept.}
  \item{max.levels}{For factors, this controls the merging of small bins using \code{MergeLevels}.}
  \item{civ}{When a continuous variable is discretized, the original continuous data can
  be provided in \code{civ} so that linearity can be computed.  See \code{Woe} for more information.}
  \item{copy.data}{Reserved for future use, indicates if the data should be copied.}
  \item{name}{The variable name.  If NULL it will be extracted from the deparsed input \code{iv}.}
  \item{\dots }{For the \code{BinaryPredictor} functions 
  the extra arguments are passed to \code{PredictivePowerCv}.  If \code{iv} is numeric
  then extra arguments are also passed to \code{BinaryCut}.  For \code{plot} the extra arguments
  are passed to \code{ShortenStrings}, which is used to shorten the names of factor levels in plots.}
  \item{verbose}{If true then calculation information is printed.}
  \item{x}{Output from one of the \code{BinaryPredictor} functions.}
  \item{y}{Unused argument for the generic \code{plot} function.}
  \item{plot.missing}{When plotting numeric variables a \code{TRUE} value 
  will add a horizontal line representing the log odds associated with
  missing values.}
  \item{type}{Reserved for future use, indicates the type of plot to be generated.  
  The only valid value now is 'bin'.}
  \item{file}{If a filename is provided then summary information will be written to a text file.}
  \item{silent}{If set to \code{TRUE} then nothing is printed to the screen.}
}
\details{
The \code{BinaryPredictor} family of functions are used to evaluate predictors of a binary outcome.  
Checks are executed for the variable class (only numeric, integer, and factor are allowed), 
missing values, predictive power, and robustness.  
If any checks fail then a "keep" flag is set to FALSE, otherwise it's TRUE.

The \code{plot} function generates a summary plot of the predictor.  Predictive power and robustness are 
printed in the plot title, along with the smallest and largest bin sizes used during discretization.  
For numeric variables a count of missing values is also printed.

The \code{print} function writes a table of variable summary information to the screen or to a file.
}
\value{
If \code{iv} is a vector then an object of class \code{BinaryPredictor} is returned with the folowing items:
  \item{name }{The variable name.}
  \item{keep }{A boolean indicating if the variable meets the criteria for missing values, 
    predictive power, etc.}
  \item{reason }{If \code{keep=FALSE} then this field contains a text string indicating the first
    criteria the variable failed to meet.}
  \item{missing}{The fraction of values that are missing / NA.}
  \item{class}{The variable class.}
  \item{predictivePower}{Results from \code{PredictivePowerCv}.}
  \item{woe}{Results from \code{Woe}.}
  
If \code{iv} is a data frame then a list of BinaryPredictor objects is returned with class 
BinaryPredictorList.

The \code{print.BinaryPredictorList} function returns a data frame with columns for the values in
the BinaryPredictor output.  The values include the variable name, predictive power, robustness, etc.
}
\author{
Justin Hemann <support@causata.com>
}
\seealso{
\code{\link{PredictivePowerCv}, \link{BinaryCut}, \link{MergeLevels}, \link{Woe}, 
\link{ShortenStrings}.}
}
\examples{
library(ggplot2)
data(diamonds)
# set a dependent variable that is TRUE when the price is above $5000
dv <- diamonds$price > 5000

# convert ordered to factor
diamonds$cut <- as.factor(as.character(diamonds$cut))
diamonds$color <- as.factor(as.character(diamonds$color))
diamonds$clarity <- as.factor(as.character(diamonds$clarity))

# evaluate diamond cut and carats, and generate a plot for each
bp.cut <- BinaryPredictor(diamonds$cut, dv)
plot(bp.cut)
bp.carat <- BinaryPredictor(diamonds$carat, dv)
plot(bp.carat)

# Evaluate all predictors, print summary to screen
# note that price does not have 100% predictive
# power since the discreatization boundary is not $5000.
# Using a sample of 10k records and 3 folds of cross validation
# for greater speed.
set.seed(98765)
idx <- sample.int(nrow(diamonds), 10000)
bpList <- BinaryPredictor(diamonds[idx, ], dv[idx], folds=3)
df.summary <- print(bpList)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
