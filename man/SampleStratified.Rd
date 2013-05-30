
\name{SampleStratified}
\alias{SampleStratified}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Draws a random, stratified sample from a vector of indices.
}
\description{
Given a vector of logical values, this returns an index where TRUE values are kept and FALSE values are sampled.
}
\usage{
SampleStratified(idxTrue, scale=1, verbose=TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{idxTrue}{
  An array of logical TRUE / FALSE values.  All TRUE values are kept (their index is always TRUE), and FALSE values are sampled 
  (their index may be TRUE or FALSE).
  }
  \item{scale}{
  Controls the sampling rate for FALSE values.  See the Details section below for more information.
  }
  \item{verbose}{
  If TRUE then summary information is printed to the screen.
  }
}
\details{
All TRUE values from the input index are kept.  The number of FALSE values that are kept is computed as follows:
\deqn{
sampleRate = \sqrt{ \frac{nFalse}{nTrue} } \frac{1}{scale} 
}
\deqn{
numKeep = round( \frac{nFalse}{sampleRate} ) 
}
Here \code{nFalse} and \code{nTrue} are the number of FALSE and TRUE values provided in the array \code{idxTrue}.
Note that if \code{sampleRate} is less than 1 then then no sampling is performed -- all FALSE values are kept.
Values of \code{scale} greater than 1 result in more FALSE values being kept; values below 1 result in fewer.
}
\value{
An array of logical values indicating which records should be kept.
}

\author{
Justin Hemann <support@causata.com>
}

\examples{
data(df.causata)
idx <- SampleStratified(df.causata$has.responded.mobile.logoff_next.hour_466=="true")
table(df.causata$has.responded.mobile.logoff_next.hour_466, idx)
}
