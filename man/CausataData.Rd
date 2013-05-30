
\name{CausataData}
\alias{CausataData}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Creates an object of class CausataData for scoring in Causata. 
}
\description{
Used for creating an object of class CausataData for scoring in Causata.  
This is essentially a dataframe with modeling data and a list of objects of class \code{CausataVariable}.
Note that the variable names in the data frame must match 
}
\usage{
CausataData(dataframe, dependent.variable=NULL, query=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{A data frame containing independent variables for modeling.}
  \item{dependent.variable}{An array of dependent variable values, or the name 
  of a column in the data frame that will be used as the dependent variable.
  If NULL then \code{dataframe} must have a column named \code{dependent.variable}.}
  \item{query}{An optional \code{Query} object that can be stored with the data.}
}
\details{
A CausataData object is a container for objects from the \code{CausataVariable} class.  
The CausataData object is passed into \code{ToPMML} to create a PMML representation of a model. 

Note that column names in the dataframe have to follow Causata naming conventions so that they can be matched to 
variables in Causata when scoring.  See \code{RToCausataNames} for details.  
Columns that do not follow conventions will remain in the data frame, but will not
have a corresponding \code{CausataVariable} generated.

The dependent variable name is set depending on the \code{dependent.variable} argument:
\itemize{
  \item{If a name is provided then that is used.}
  \item{If a vector of data is provided then the name attribute of the vector will be used.  
  If the name attribute is not set then the default name of "dependent.variable" will be used.}
  }
}
\value{
\code{CausataData} returns an object of class CausataData.  The object has the following fields:
  \item{df }{The dataframe.  If there is not a column for the dependent variable then it is added.}
  \item{variableList }{A list of variables of class \code{CausataVariable}.}
  \item{dvName }{The name of the dependent variable.}
  \item{skippedVariables }{Variables in \code{df} with names that don't meet naming conventions and
    do not have corresponding \code{CausataVariable} objects.}
  \item{query }{The object passed in through the query argument is stored here.}

\code{GetQuery} returns the query object.
}
%\references{
%}
\author{
Justin Hemann <support@causata.com>
}
%\note{
%%  ~~further notes~~
%}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataVariable}}, \code{\link{ToPmml}}, \code{\link{Query}}, \code{\link{RToCausataNames}}.
}
\examples{
df <- data.frame(f1__AP=factor(c("a","b",NA)), f2__AP=factor(c("x","y",NA)))
causataData <- CausataData(df, rep(0,nrow(df)))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
