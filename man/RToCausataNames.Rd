
\name{RToCausataNames}
\alias{RToCausataNames}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Converts R-friendly causata column names to the corresponding Causata system name
}
\description{
Converts R-friendly causata column names to the corresponding Causata system name
}
\usage{
RToCausataNames(name.vector)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name.vector}{
    A character vector of column names.
  }
}
\details{
Causata variables follow two naming conventions.  The first is found in data exported from within Causata using the
"R Formated CSV" option:

\code{variable.name_Time.Domain_id} where id is a number, e.g. \code{variable.name_Time.Domain_123}

The second convention is found in data exported from the SQL interface:

\code{variable.name__Time.Domain}

Example conversions:

\code{variable.name__Time.Domain} becomes \code{variable-name$Time Domain}

\code{variable.name_Time.Domain_123} is unchanged.

Variables that do not conform to these conventions will be mapped to \code{"No Causata Name"} and a warning will be triggered.
}
\value{
An character vector of mapped variable names.
}

\author{
David Barker <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataData}}, \code{\link{CausataVariable}}, \code{\link{CausataToRNames}}.
}
\examples{
RToCausataNames(c("variable.name__Time.Domain", "variable.name_Time.Domain_123"))
RToCausataNames("bad-name-doesn't fit convention")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% __ONLY ONE__ keyword per line
