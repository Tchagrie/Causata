
\name{Config.DeleteVariable}
\alias{Config.DeleteVariable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Deletes a Causata variable.
}
\description{
This function attempts to delete the named variable from Causata's configuration.
}
\usage{
Config.DeleteVariable(causata.config, variable.name)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{causata.config}{
  An object from \code{\link{CausataConfig}}.
  }
  \item{variable.name}{
  The internal system-name of the variable to create.
  }
}
\details{
This function attempts to delete the named variable from Causata's configuration.
}
\value{
TRUE if the variable deletion succeeded.
Otherwise, the response from the server (including error messages) is returned.  
This may occour if other variables are derived from the variable you're trying to delete, 
or if it is used in live decision engines or camapigns.
}

\author{
David Barker <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataConfig}}.
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% __ONLY ONE__ keyword per line

