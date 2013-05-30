
\name{CausataConfig}
\alias{CausataConfig}
\alias{is.CausataConfig}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Creates an object of class CausataConfig for working with Causata from within R. 
}
\description{
The CausataConfig object stores information that is used to connect to a configuration server to upload models,
add variables, delete variables, etc.
}
\usage{
CausataConfig(config.server.host, config.server.port, config.username, 
  config.password, protocol="https://", group=NULL)
is.CausataConfig(this)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{config.server.host}{The host server URL.}
  \item{config.server.port}{The host server port.}
  \item{config.username}{Username for Causata configuration access.}
  \item{config.password}{Password for a Causata configuration access.}
  \item{protocol}{The protocol for connecting to the server.}
  \item{group}{Configuration data from the group provided will be loaded from the configuration file.  
    See \code{LoadCausataConfig}. If the same parameter is provided in the configuration 
    file and the function argument then the function argument will take precedence.}
  \item{this}{An argumement that will be tested, see \code{is}.}
}
\details{
Contact your Causata engagement manager for the settings required for these parameters.
}
\value{
An object of class CausataConfig is returned. 
}
%\references{
%}
\author{
David Barker <support@causata.com>
}
%\note{
%%  ~~further notes~~
%}
\seealso{
\code{\link{Config.DeleteVariable}}, \code{\link{Config.CreatePrimaryVariable}}, 
\code{\link{UploadModel}}, \code{\link{LoadCausataConfig}}, \code{\link{is}}.
}
\examples{
# The settings below are not for an actual server, 
# they are for illustration purposes only.
config <- CausataConfig("server.causata.com","8002","causatauser","Bg20qydd6")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
