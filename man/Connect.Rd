\name{Connect}
\alias{Connect}
\alias{GetData}
\alias{GetData.Connect}
\alias{GetCausataData}
\alias{GetCausataData.Connect}
\alias{GetRawData}
\alias{GetRawData.Connect}
\alias{Close}
\alias{Close.Connect}
\alias{GetQuery}
\alias{GetQuery.CausataData}
\alias{is.Connect}
\alias{GetNames.Connect}
\alias{GetNames}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Connect to Causata and extract data.}
\description{
These functions open a connection to a Causata server, extract data, and close the connection.
}
\usage{
Connect(sql.server.host, sql.server.port, sql.username, sql.password, 
  group=NULL, verbose=FALSE)
  
\method{GetData}{Connect}(conn, query, ...)

\method{GetCausataData}{Connect}(conn, query, dependent.variable, ...)

\method{GetRawData}{Connect}(conn, query, ...)

\method{GetQuery}{CausataData}(this, ...)

\method{GetNames}{Connect}(this, kind, ...)

\method{Close}{Connect}(conn, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{sql.server.host}{The SQL server hostname.  Contact your Causata Engagement Manager for the correct value.}
  \item{sql.server.port}{The SQL server port.  Contact your Causata Engagement Manager for the correct value.}
  \item{sql.username}{Your Causata username.  Contact your Causata Engagement Manager for the correct value.}
  \item{sql.password}{Your Causata password.  Contact your Causata Engagement Manager for the correct value.}
  \item{group}{Configuration data from the group provided will be loaded from the configuration file.  See \code{LoadCausataConfig}.
  If the same parameter is provided in the configuration file and the function argument then the function argument will take precedence.}
  \item{verbose}{If TRUE then the connection information will be printed to the screen.}
  \item{conn}{A connection object from \code{Connect}.}
  \item{query}{A query object from \code{Query}.}
  \item{this}{A \code{CausataData} object.}
  \item{kind}{The kind of variable name to return, valid values are \code{'display'} and \code{'system'}.}
  \item{dependent.variable}{See \code{\link{CausataData}}.}
  \item{\dots}{Unused arguments for other methods.}
}
\details{
\itemize{
  \item \code{Connect} opens a SQL connection to a Causata server using functions from the \code{RMySQL} package.
  \item \code{GetData} executes the provided query and returns data in a data frame.
  \item \code{GetCausataData} executes the provided query and returns data in a \code{CausataData} object.
  \item \code{GetRawData} returns unaltered data from the lower level query commands.
  \item \code{Close} simply closes a database connection.
}
\code{GetData} and \code{GetRawData} return data encoded in different formats using the Causata SQL interface.
\code{GetData} is consistent with Causata data exported into CSV files, so it should generally be used instead of 
\code{GetRawData}.  

The default behavior when using SQL queries of Causata within R
is that boolean data in Causata is returned as numeric (1=TRUE, 0=FALSE), and text data is returned as
characters.  The other functions, \code{GetData} and \code{GetCausataData}, convert boolean data to
factors with level names "true" and "false", and return character data as factors.  This is the same format
as data exported from Causata to CSV files.

\code{GetNames} is used to return the system names or display names for Causata variables.
}
\value{
\code{Connect} returns an object of class \code{Connect}.  \code{GetData} and \code{GetRawData} return
data frames, while \code{GetCausataData} returns an object of class \code{CausataData}.  
Finally, \code{GetNames} returns a character vector of variable names.
}
\author{
David Barker <support@causata.com>}
\seealso{
\code{\link{Connect}}, \code{\link{Query}}, \code{\link{CausataData}}, 
\code{\link{RMySQL}}, \code{\link{LoadCausataConfig}}.
}
\examples{
# This command requires a connection to a Causata server
# the example below is for illustration only
\dontrun{
conn <- Connect(hostname="example.causata.com", username="exampleuser", 
  password="examplepassword")
data <- GetData(conn, Query())
Close(conn)}
}
\keyword{SQL}
