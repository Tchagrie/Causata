
\name{CausataToRNames}
\alias{CausataToRNames}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Converts Causata system names to R-friendly column names.
}
\description{
Causata system names are converted to R-friendly column names in a reversible way.
}
\usage{
CausataToRNames(name.vector)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name.vector}{
    A character vector of Causata system names.  E.g. c("total-spend$All Past")
  }
}
\details{
Causata system names may include lowercase letters, numbers, and dashes.  Dashes (-)are not allowed
in R names, so they are mapped to dots (.).  

Causata uses a dollar sign ($) to separate a system
name and a time domain.  Dollar signs are not allowed in R names, 
so they are mapped to a double underscore (__).
}
\value{
A list, mapping each input name to the corresponding R name.
}

\author{
David Barker <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataData}}, \code{\link{CausataVariable}}, \code{\link{RToCausataNames}}.

}
\examples{
CausataToRNames(c("variable-name$Time Domain"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% __ONLY ONE__ keyword per line
