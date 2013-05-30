\name{LoadCausataConfig}
\alias{LoadCausataConfig}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Load passwords and configuration data.}
\description{
Loads Causata configuration data, including usernames and passwords, from a configuration file.  
This way scripts can be shared among users without compromising passwords.
}
\usage{
LoadCausataConfig(group)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{group}{A text string indicating a group name.  In a configuration file, arguments under the  will be returned in a list.}
}
\details{
Configuration data can be stored in a local file located in the user directory.  The file must be named 
\code{.causata-config.yaml}, and it must be located in the user's home directory.  This function
will attempt to load the file using \code{path.expand}:

\code{path.expand("~/.causata-config.yaml")}

Two functions in the Causata package will call \code{LoadCausataConfig} if a group name is provided: 
\code{CausataConfig}, and \code{Connect}.  
The parameter names provided in the config file will be mapped to the input parameters of these functions.

The format of the configuration file is simple.  There are one or more groups with a set of indented parameters below.
The group and parameter names are followed by a colon.  

If the user has a configuration file as shown in the example below, then calling this function returns a list as follows:

\bold{Example .causata-config.yaml file}
\preformatted{# Use hash for comments
example.1:
  sql.server.host : 123.456.789.219
  sql.server.port : 33060
  config.server.host : 123.456.789.100
  config.server.port : 8003
  username : example@causata.com
  password : ni83jfH

example.2:
  sql.server.host : 123.456.789.999
  sql.server.port : 33060
  config.server.host : 123.456.789.500
  config.server.port : 8003
  username : example@causata.com
  password : 972hfgHB}

If "example.1" is used then the first set of parameters is returned in a list:

\preformatted{  LoadCausataConfig("example.1")
  $sql.server.host
  [1] "123.456.789.219"
  
  $sql.server.port
  [1] 33060
  
  $config.server.host
  [1] "123.456.789.100"
  
  $config.server.port
  [1] 8003
  
  $username
  [1] "example@causata.com"
  
  $password
  [1] "ni83jfH"}

Similarly, if the "example.2" group is supplied then the second set of parameters is returned in a list:

\preformatted{  LoadCausataConfig("example.2")
  $sql.server.host
  [1] "123.456.789.999"
  
  $sql.server.port
  [1] 33060
  
  $config.server.host
  [1] "123.456.789.500"
  
  $config.server.port
  [1] 8003
  
  $username
  [1] "example@causata.com"
  
  $password
  [1] "972hfgHB"}
}
\value{
A list of parameters for the group is returned.
}
\references{
http://www.yaml.org/}
\author{
Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{path.expand}},
\code{\link{yaml.load_file}},
\code{\link{CausataConfig}},
\code{\link{Connect}}.
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
