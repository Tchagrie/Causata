
\name{Query}
\alias{Query}
\alias{is.Query}
\alias{Ops.Query}
\alias{Ops.FocalPointQuery}
\alias{WithVariables}
\alias{Variables}
\alias{Variables<-}
\alias{Variables.Query}
\alias{Variables<-.Query}
\alias{Limit}
\alias{Limit<-}
\alias{Limit.Query}
\alias{Limit<-.Query}
\alias{as.character.Query}
\alias{WithEvents}
%- Also NEED  an '\alias' for EACH other topic documented here.
\title{Build queries to extract data from Causata.}
\description{
The Query class is used to generate SQL queries for Causata.  The queries are built with the helper 
objects \code{WithVariables}, \code{Where} and \code{Limit}.  
SQL is generated when \code{as.character()} is invoked on the query object.
}
\usage{
Query()

\method{Limit}{Query}(this, \dots)

\method{Limit}{Query}(this) <- value

\method{Variables}{Query}(this, \dots)

\method{Variables}{Query}(this) <- value

%\method{is}{Query}(object, class2)
WithVariables(\dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{A query object.}
  \item{value}{For \code{Query} this is a number indicating the maximum number of records to return.
  For \code{Variables} this is one or more variable names in a list.}
  %\item{object}{See \code{is}.}
  %\item{class2}{See \code{is}.}
  \item{\dots}{For \code{WithVariables} this is a single variable, or a list of variables.
  For \code{Query} and \code{Variables} this is unused extra arguments.}
}
\details{
The Query object builds a query for customer data, a blank Query corresponds to 

\code{SELECT * FROM Customers variable}

This query can be made more specific by adding variables with \code{WithVariables}, adding where 
clauses with \code{Where} or setting a row limit with \code{Limit}.
The actual SQL query can be generated with as.character, e.g. \code{as.character(Query())}.

The variables and limit can be retrieved and modified with \code{Variables(query)} 
and \code{Limit(query)} respectively.
}
\value{\code{Query} returns a blank Query object.}

\author{
David Barker, Justin Hemann (support@causata.com)
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{FocalPointQuery}}, 
\code{\link{Connect}}, 
\code{\link{Variables}}, 
\code{\link{Where}}, 
\code{\link{CausataData}},
\code{\link{is}}.
}
\examples{
q <- Query()
q <- q + WithVariables(c("var1", "var2"))
q <- q + Where("variable-one", GreaterThan(30))
Variables(q) # returns c("var1", "var2")
Variables(q) <- c("var2", "var3") # set the variables for this query
Limit(q) # since the limit has not been set this returns NULL
Limit(q) <- 1000 # Sets the limit to 1000
as.character(q)

q <- Query() + WithVariables("variable-one", "variable-two") + 
  Where("variable-one", GreaterThan(5))
# The example below is commented out since it requires a server connection.
# With a connection this would retrieve data and return it in a dataframe df.
\dontrun{
conn <- Connect(hostname, port, username, password)
data <- GetData(conn, q)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ SQL }
% __ONLY ONE__ keyword per line
