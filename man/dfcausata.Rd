\name{df.causata}
\alias{df.causata}
\docType{data}
\title{
Example data for the Causata package.
}
\description{
An example data set containing a non-random sample of anonymized Causata records.
}
\usage{data(df.causata)}
%%\format{
%%  A data frame with 16904 observations on 150 variables.  
%%  \describe{
%%    \item{\code{x}}{a numeric vector}
%%    \item{\code{y}}{a numeric vector}
%%  }
%%}
\details{
The data frame contains 16904 observations on 150 variables.  
The query used to generate this data has a
focal point of a decision event where a mobile ad banner was
selected for a web page.  The dependent variable measures whether a user
responds (clicks) on the banner within the hour following the decision.

The column \code{has.responded.mobile.logoff_next.hour_466} is used as a dependent variable.
}

\examples{
data(df.causata)
}
\keyword{datasets}
