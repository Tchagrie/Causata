
\name{CausataVariable}
\alias{CausataVariable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Creates an object of class CausataVariable for scoring in Causata. 
}
\description{
Preprocessing steps are recorded in a CausataVariable object 
so they can be written to PMML and executed in Causata.
}
\usage{
CausataVariable(variableName, values, causata.name=variableName)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{variableName}{
  A character string containing the variable name.
  }
  \item{values}{
  An array of values for the variable, or a factor.
  }
  \item{causata.name}{
  A character string containing the variable name in a Causata format.
  }
}
\details{
The CausataVariable class is used to record preprocessing steps such as replacing outliers, binning, and replacing missing values.  Typically \code{CausataVariable} is not called directly -- instead it is 
called repeatedly by \code{CausataData}.
}
\value{
An object of class CausataVariable is returned. 
}

\author{
Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataData}}.
}
\examples{
CausataVariable("variable.name__All.Past", c(1,2,3,4,5))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
