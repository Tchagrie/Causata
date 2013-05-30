
\name{ReadCausataCsv}
\alias{ReadCausataCsv}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Loads data from a Causata CSV file.
}
\description{
Loads data exported from a Causata CSV file into a data frame.  
Metadata from Causata is used to set variable names and classes.  
The function arguments allow for selective filtering of rows and / or columns.
}
\usage{
ReadCausataCsv(causataR, include=c(), exclude=c(), maxMb=1000, 
  colFilterFunc=NA, rowIndex=NA, nrows=NA, metadata=FALSE, 
  debug=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{causataR}{
  An output list from the \code{\link{ReadCausataR}} function.
  }
  \item{include}{
  A list of variable names or patterns to match against the variables in the CSV data.  Matches are kept.
  See 'Details' for more information.
  }
  \item{exclude}{
  A list of variable names or patterns to match against the variables in the CSV data.  Matches are excluded.  
  See 'Details' for more information.
  }
  \item{maxMb}{
  Specifies the maximum megabytes of data to load in one pass, which is computed before rows and columns
  are filtered out.  This constraint is applied only if \code{nrows} is specified.  
  See 'Details' for more information.
  }
  \item{colFilterFunc}{
  An optional function that is applied to each column of data.  The function must take the independent 
  variable as its first argument, and it must return a logical (TRUE/FALSE) value OR a list including 
  an element named \code{keep}.  If the value is TRUE then the variable is kept, if FALSE the 
  variable is discarded.
  }
  \item{rowIndex}{An optional vector of logical values where TRUE indicates which rows should be kept.}
  \item{nrows}{The maximum number of rows to read from the csv file.  This is applied before rows are filtered.}
  \item{metadata}{If FALSE then a data frame is returned.  If TRUE then a list of outputs is returned.}
  \item{debug}{If TRUE the column filter is applied with a for loop instead of \code{doMC}, which is easier to debug.}
  \item{...}{Extra arguments are sent to the \code{colFilterFunc}.}
}
\details{
CSV data from Causata is read into a data frame.  The arguments allow filtering by column names, row index, 
or filtering by column calculations when a function is provided.

The \code{include} and \code{exclude} arguments are used to select which columns to load from the csv file.  
If these arguments are left at their default values then all columns are loaded.  
If \code{include} and \code{exclude} are set then \code{exclude} is applied first, followed by \code{include}.

The \code{maxMb} parameter can be used to load and filter data in several passes, which would reduce the 
total memory required if row / column filters
are specified in \code{colFilterFunc} or \code{rowIndex}.
If the estimated required memory exceeds \code{maxMb}, then the load will be broken into multiple passes,
each no larger than \code{maxMb}.
The default estimate is 12 bytes per cell of a data frame, so when \code{MaxMb=1000} (about a 
gigabyte) that corresponds to a data frame with 100k rows and 833 columns. 
}
\value{
A data frame of CSV data, or a list containing the data frame and metadata as follows:
\item{df}{A data frame of CSV data.}
\item{metadata}{A list of outputs returned from the \code{colFilterFunc}.}
}

\author{
Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

%\seealso{
%\code{\link{cut}}.
%}
%\examples{
%}