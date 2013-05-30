
\name{Where}
\alias{Where}
\alias{EqualTo}
\alias{NotEqualTo}
\alias{GreaterThan}
\alias{GreaterThanOrEqualTo}
\alias{LessThan}
\alias{LessThanOrEqualTo}
\alias{Like}
\alias{BeginningWith}
\alias{In}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Query WHERE clause and comparison operations}
\description{
The Where function creates a WHERE clause that can be added to Query or FocalPointQuery objects.
}
\usage{
Where(variable, operation=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{variable}{A string matching the name of a Causata variable, 
  or a string representing a SQL WHERE clause, like \code{"variable <> 123"}.}
  \item{operation}{An operator of class \code{RawOperator}, such as \code{GreaterThan(123)} or \code{EqualTo(123)}}
}
\details{
There are three basic usage patterns. These are all equivalent:
\itemize{
  \item{\code{Where("variable.`variable-name` <> 'string value'")}}
  \item{\code{Where("variable-name", "<> 'string value'")}}
  \item{\code{Where("variable-name", NotEqualTo("string value")}}
}
The first form is a raw SQL WHERE clause, when using this form, you must correctly reference and escape the variable name, and the value for the operator you choose.
The second form is (variable.name, operation).  Using this form the variable name will be correctly referenced and escaped.  However, the right hand side (the operation) must still be correctly escaped by you.
The third form is (variable.name, operation.object).  Using this form the variable name and operation are both correctly escaped.
The allowable operations in the third form are as follows:
\tabular{ll}{
  \bold{Operation}\tab \bold{Arguments} \cr
  \code{BeginningWith}\tab Single value\cr
	\code{EqualTo}\tab Single value\cr
  \code{NotEqualTo}\tab Single value\cr
  \code{GreaterThan}\tab Single value\cr
  \code{GreaterThanOrEqualTo}\tab Single value\cr
  \code{LessThan}\tab Single value\cr
  \code{LessThanOrEqualTo}\tab Single value\cr
  \code{Like}\tab Single value\cr
  \code{In}\tab One or more comma-separated values\cr
	}
}
\value{
An object of class Where used for building queries.
}

\author{
David Barker (support@causata.com)
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Query}}, 
\code{\link{FocalPointQuery}}.
}
\examples{
q <- FocalPointQuery("page-view") + Where("page-view-count", GreaterThan(10))
q <- FocalPointQuery("page-view") + 
     Where("total-spend", LessThanOrEqualTo(100)) + 
     Where("total-spend", GreaterThan(1))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ SQL }
% __ONLY ONE__ keyword per line
