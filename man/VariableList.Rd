
\name{Vinclude}
\alias{Vinclude}
\alias{Vinclude.Connect}
\alias{Vexclude}
\alias{Vexclude.Connect}
\alias{Vtime}
\alias{Vtime.Connect}
\alias{BacktickCollapse}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Create lists of variables from Causata for queries.
}
\description{
This collection of functions is used to create lists of variables from Causata.  The lists can be inputs to queries 
using the Causata SQL interface.
}
\usage{
\method{Vinclude}{Connect}(this, name.patterns=NULL, label.patterns=NULL, 
  and=TRUE, \dots)

\method{Vexclude}{Connect}(this, variable.names=NULL, name.patterns=NULL, 
  label.patterns=NULL, and=TRUE, \dots)

\method{Vtime}{Connect}(this, variable.names, domains, \dots)

BacktickCollapse(variable.names)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{
  An object from the class \code{Connect}.  This object stores the list of available variable names and time domains.}
  \item{name.patterns}{
  A character vector of variable system name patterns that will be used with \code{grep} to find matches.}
  \item{label.patterns}{
  A character vector of variable label names patterns that will be used with \code{grep} to find matches.}
  \item{and}{
    If multiple filtering arguments are supplied, then this controls whether variables have to match all of
    the criteria (\code{and=TRUE}) or any of the criteria (\code{and=FALSE}).}
  \item{variable.names}{Character vector containing Causata variable system names.}
  \item{domains}{Character vector containing Causata variable time domains.}
  \item{\dots}{Extra unused arguments.}
}
\details{
These functions create lists of variables that are filtered according to the given criteria.

\code{Vinclude} returns a character array of all variables matching the provided criteria.  If the 
criteria are left at their default values (\code{NULL}) then a list of all available variables is returned.

\code{Vexclude} works in the same manner as \code{Vinclude}, except that variables matching the criteria are excluded.
If \code{variable.names} is \code{NULL} then the matching process begins with all avaible variables.  
If \code{variable.names} contains variable names then the matching process will select from the provided names.

\code{Vtime} appends time domains to the variables.

To see a list of the available variables and time domains, open a \code{Connect} object and view the embedded
data frames of variable metadata.  See the example below for details.
}
\value{
\code{Vinclude}, \code{Vexclude}, and \code{Vtime} return a vector of character strings naming variables found in Causata.

\code{BacktickCollapse} returns a single character string with the variables names concatenated together and surrounded by
backticks.  This string can be used directly in a SQL query to Causata.
}

\author{
Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Connect}, \link{grep}}.}
\examples{
# Some of these examples require a Causata connection, so they are not run
\dontrun{
conn <- Connect(group="example")

# View available variables
View(conn$variables)

# View available time ranges
View(conn$timeRanges)

# View available time points
View(conn$timePoints)

# Get a list of variables matching the given labels: all online and demographics
variables <- Vinclude(conn, label.patterns=c("online", "demographics"))

# Get a list of all variables except those with "test" in the name
variables <- Vexclude(conn, name.patterns="test")

# build a query string and extract data
query.str <- paste(
  "select", BacktickCollapse(variables),
  "from customers")
df <- GetData(conn, query.str)
Close(conn)
}

# simple example with BacktickCollapse
BacktickCollapse(c("variable-one", "variable-two"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
