\name{VariableDefinition}
\alias{VariableDefinition}
\alias{is.VariableDefinition}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Defines information for creating variables in Causata.
}
\description{
This function defines variable information, including the name, description, and labels, for creating new variables in Causata.
}
\usage{
VariableDefinition(name, display.name = name, description = name, 
  labels = list(), 
  author = Sys.info()[["user"]], 
  timestamp = as.integer(1000 * as.numeric(format(Sys.time(), "\%H\%M\%OS3"))), 
  archived = FALSE, 
  categorizing.attribute = "", 
  output.value.count = -1,
  data.type = "double")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
The variable system name.  Only letters, numbers, and dashes are allowed in the name, e.g. \code{most-recent-product-viewed}.
}
  \item{display.name}{
The variable display name as it will be shown in Causata, e.g. \code{Most Recent Product Viewed}.
}
  \item{description}{
A brief description of the variable, which will be displayed in Causata.
}
  \item{labels}{
A list of optional variable labels, used for categorization.
}
  \item{author}{
The variable author name.
}
  \item{timestamp}{
The timestamp for when the variable was created.  The format is milliseconds from the Unix epoch, Jan 1 1970, 00:00 UTC.
}
  \item{archived}{
A boolean indicating if this variable is archived or not.}
  \item{categorizing.attribute}{Name of the Causata attribute used to categorize the output.}
  \item{output.value.count}{The number of output values.}
  \item{data.type}{The data type of the output.  Allowable values are "double", "float", "long", "integer", or "short".}
}
\details{
Consult your Causata documentation for more information about variables in Causata.
}
\value{
An object of class VariableDefinition is returned.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
David Barker <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{UploadModel}}
}
\examples{
variable.definition <- VariableDefinition(name="most-recent-product-viewed", 
  display.name="Most Recent Product Viewed",
  description="The most recent product viewed online.",
  labels=list("online","products"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.