
\name{Config.CreatePrimaryVariable}
\alias{Config.CreatePrimaryVariable}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Defines a Causata primary variable.
}
\description{
This function attempts to add a new variable to variable set configured in Causata.}
\usage{
Config.CreatePrimaryVariable(causata.config, variable.name, 
                             variable.display.name=variable.name, 
                             variable.expression)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{causata.config}{
  An object from \code{\link{CausataConfig}}.
  }
  \item{variable.name}{
  The internal system-name of the variable to create.
  }
  \item{variable.display.name}{
  The user-visible name of the variable to create.
  }
  \item{variable.expression}{
  The variable expression that defines the variable.
  }
}
%\details{
%This function attempts to add a new variable to variable set configured in Causata.
%}
\value{
TRUE if the variable definition succeeded.
Otherwise, the response from the server (including error messages) is returned.
}
\author{
David Barker <support@causata.com>
}

\seealso{
\code{\link{CausataConfig}}.
}
\examples{
# The settings below are not for an actual server, 
# they are for illustration purposes only.
causata.config <- CausataConfig("server.causata.com","8002",
  "causatauser","Bg20qydd6*")

# the command below is commented out since it requires a live server to run
#result <- Config.CreatePrimaryVariable(causata.config, 
#  variable.name="online-has-page-view", 
#  variable.display.name="Online: Has Page View", 
#  variable.expression="INCLUDES page-view")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% __ONLY ONE__ keyword per line

