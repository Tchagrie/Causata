\name{UploadModel}
\alias{UploadModel}
\alias{UploadModelWithValidation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Loads a model definition into Causata for scoring.
}
\description{
Three different sets of configuration information are combined to upload a model to Causata for scoring.
}
\usage{
UploadModel(causata.config, model.definition, variable.definition, verbose=FALSE)

UploadModelWithValidation(causata.config, model.definition, variable.definition,
  connection, query.function, record.error.max, verbose=FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{causata.config}{An object from \code{CausataConfig}.}
  \item{model.definition}{An object from \code{ModelDefinition}.}
  \item{variable.definition}{An object from \code{VariableDefinition}.}
  \item{verbose}{If TRUE then information is printed to the console.}
  \item{connection}{An object from \code{Connect}.}
  \item{query.function}{A function that returns a query string or \code{Query} object.
    The first argument to this function must accept a character string representing
    a variable name that will be added to the query.  See the Details section below for more information.}
  \item{record.error.max}{The absolute value of the largest acceptable error.}
  \item{...}{Extra arguments are passed to the \code{query.function}.}
}
\details{
\code{UploadModel} translates a model into PMML and uploads it to Causata, where it will become available as a new variable.

\code{UploadModelWithValidation} adds validation to the upload process.  The model is uploaded, then a new query is 
executed using the provided \code{query.function}.  The new query will include the variables originally
used to train the model, and the new model variable from Causata.  The R scoring process is re-applied to the new data, and 
the results from R and Causata are compared.  The validation is deemed successful if the difference in results is below
the value provided in \code{record.error.max}.

There are two important requirements for the query function:
\enumerate{
  \item The query function must accept a variable name as its first argument -- this argument is used to add the 
    score variable to the query.
  \item The query function must return a query including all of the variables that were originally used to train the model.
    The recommended best-practice is to use a function to extract the training data, then re-use the
    same function for the validation process.
}
}
\value{
For \code{UploadModel}, if the upload was successful then a boolean TRUE is returned.  If the upload failed
then an error message is returned.

\code{UploadModelWithValidation} returns a list with the following elements:
\item{result}{A boolean that is TRUE if the validation was successful and FALSE otherwise.}
\item{validation.data}{A dataframe containing data used in the validation process.}
\item{errors}{An array of error values, which are the absolute value of the difference between \code{prediction}
  and \code{actuals}.}
\item{prediction}{The model scores as calculated by R.}
\item{model.matrix}{The model matrix used by R to generate scores.}
\item{actuals}{The model scores as calcualted by Causata.}
\item{problematic.indices}{An array of indices that are TRUE if the error value exceeds the
  \code{record.error.max} and FALSE otherwise.}
}

\author{
David Barker, Justin Hemann <support@causata.com>
%%  ~~who you are~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{CausataConfig}}, \code{\link{ModelDefinition}}, \code{\link{VariableDefinition}}, \code{\link{Connect}}, 
\code{\link{Query}}, \code{\link{CausataData}}.
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# An example query function for UploadModelWithValidation
# The focal point query below returns profiles from the most recent
# ad impression where the product name is "Test Product".
query.function <- function(variables, more.variables=c(), limit=100){
  query <- paste(
    "select", BacktickCollapse(c(variables, more.variables)),
    "from Scenarios S,",
    "     `ad-impression` E",
    "where S.profile_id = E.profile_id",
    "  and S.focal_point = E.timestamp",
    "  and is_last(E.timestamp)",
    "and exists",
    "( select *",
    "  from `ad-impression` A",
    "  where A.`product-name` = 'Test Product'",
    ")",
    "Limit", limit)
  return(query)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
