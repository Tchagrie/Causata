\name{ToPmml}
\alias{ToPmml}
\alias{ToPmml.GlmnetModelDefinition}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generates a PMML representation of a model.}
\description{Encodes a glmnet model in a string of PMML text for importing into Causata.}
\usage{
\method{ToPmml}{GlmnetModelDefinition}(model.definition, variable.definition, verbose=FALSE, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model.definition}{An object from \code{GlmnetModelDefinition}.}
  \item{variable.definition}{An object from \code{VariableDefinition}.}
  \item{verbose}{If TRUE then translation information is printed to the console.}
  \item{\dots}{Extra unused arguments.}
}
\details{
The PMML text string can be written to a file using the \code{\link{saveXML}} function from the XML package.
}
\value{
Returns a string of PMML text.
}

\author{
David Barker, Justin Hemann <support@causata.com>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{UploadModel}}, \code{\link{ModelDefinition}}, \code{\link{VariableDefinition}}, \code{\link{saveXML}}.
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
%\examples{
%}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
