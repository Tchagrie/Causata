\name{predict.GlmnetModelDefinition}
\alias{predict.GlmnetModelDefinition}
\title{
Generate predictions for a glmnet model.
}
\description{
Generate predictions for a glmnet model.
}
\usage{
\method{predict}{GlmnetModelDefinition}(object, data, verbose = FALSE, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{An object from \code{ModelDefinition}.}
  \item{data}{A dataframe that will be used to generate predictions.}
  \item{verbose}{If TRUE then prediction information will be printed to the console.}
  \item{\dots}{Extra unused arguments.}
}
\details{
This function generates predictions using the data provided.  If columns in the model matrix are missing
then columns of zeros will be inserted and a warning will be generated.  Typically transformations are 
applied using \code{GetTransforms} before \code{predict} is applied.
}
\value{
A list is returned with elements as follows:
\item{model.matrix }{The model matrix used to calculate predicted values.}
\item{predicted }{Predicted values.}
\item{lambda }{The lambda value used by \code{glmnet}.}
}
\author{Justin Hemann <support@causata.com>}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{ModelDefinition}, \link{glmnet}, \link{model.matrix}, \link{glmnet}, \link{GetTransforms}.}
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.