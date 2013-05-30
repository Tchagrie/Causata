
\name{ReadCausataR}
\alias{ReadCausataR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Parses an R file exported with Causata data.
}
\description{
Parses an R file exported with Causata data.  The information in the R file can be used to filter or select variables.
}
\usage{
ReadCausataR(rFile, countRows=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rFile}{
  The R file to process, including path.
  }
  \item{countRows}{
  If TRUE the rows in the CSV file will be counted.  This step can reduce memory requirements.
  }
}
\details{
This function parses the R code exported with Causata data.  File names, column names, and column classes are extracted.
}
\value{
A list is returned with elements as follows:
\item{fileR}{A filename of the R file, including the path.}
\item{fileData}{A filename of the CSV data file, including the path.}
\item{colClasses}{The classes of each column, e.g. numeric, factor, etc.}
\item{col.names}{The column names of each column.}
\item{nrows}{The number of rows in the CSV data.  If \code{countRows} is FALSE then the value is set to \code{-1}.}
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
