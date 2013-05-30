\name{ModelDefinition}
\alias{ModelDefinition.cv.glmnet}
\alias{ModelDefinition}
\alias{GlmnetModelDefinition}
\alias{is.ModelDefinition}
\alias{GetQuery.ModelDefinition}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Define model metadata.
}
\description{
This function defines model metadata for models that will be uploaded to Causata.}
\usage{
\method{ModelDefinition}{cv.glmnet}(model, causata.data, formula, 
  lambda = model$lambda.1se, \dots)
%is.ModelDefinition(this)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{A model object from \code{cv.glmnet}.}
  \item{causata.data}{Model training data from \code{CausataData}.}
  \item{formula}{The \code{formula} used to train the model.}
  \item{lambda}{The lambda parameter from glmnet.}
  %\item{this}{A ModelDefinition object.}
  \item{\dots}{Extra unused arguments.}
}
\details{
The package vignette illustrates how the ModelDefinition function is used.
}
\value{
An object of class \code{ModelDefinition} is returned is returned by the ModelDefinition function.  
% GetQuery returns the query from the ModelDefinition object.
}

\author{
David Barker <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{UploadModel}}, \code{\link{cv.glmnet}}, \code{\link{CausataData}}, \code{\link{formula}},
\code{\link{is}}.
}
%\examples{}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
