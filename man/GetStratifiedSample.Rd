
\name{GetStratifiedSample}
\alias{GetStratifiedSample}

\title{
Gets a stratified sample of data from Causata
}
\description{
Extracts a stratified sample of data
}
\usage{
GetStratifiedSample(connect, query, stratification.variable, 
                    stratification.variable.name, 
                    stratification.value=0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{connect}{Causata connect object - used to resample at the stratified sampling rates.}
  \item{query}{Causata query object - used to resample at the stratified sampling rates.  Note that the \code{Limit} must be defined.}
  \item{stratification.variable}{A vector of values on which to base the stratification.}
  \item{stratification.variable.name}{The name of the Causata variable that is used as the basis of stratification.}
  \item{stratification.value}{Value of the stratification.variable which will determine the stratum for a record.}
}
\details{
This function gets a stratified sample of data from Causata.  The population will be split into two strata based on whether the \code{stratification.variable} value for a record matches the \code{stratification.value}.  Sampling rates for the two strata are then calculated where the rate for the larger strata, strata.A is:

\code{sample.rate.A = sqrt((# records in strata.B) / (# records in strata.A))}

New queries are run to resample the Causata data at these sample rates.
}
\value{
Returns a list with two elements as follows:
\item{df}{A dataframe of sampled data containing all of the variables found in \code{query}.}
\item{weights}{A vector of weight values.  The weights are the inverse of the probability of selecting a record in the sample.}
}
\author{Suzanne Weller <support@causata.com>}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Connect}}, \code{\link{Query}}, \code{\link{Limit}}.
}
\examples{
# create some variables to query for
variables <- c('customer-id', 'total-spend')

# create a stratified sample given an initial query
# The commands below are commented out since they require an actual server connection
#connection <- Connect(hostname="server.causata.com",
#  username="user@gmail.com", password="enw8Q!mN")
#query <- Query() + Limit(500)
#df <- GetData(connection, query)

# The commands below are commented out since they require an actual server connection
#sampled.data <- GetStratifiedSample(connection, query, 
#  df[['has.purchase__Next.30.Days']], 'has.purchase__Next.30.Days', "true")
#table(sampled.data$weights)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ factor }
%\keyword{ levels }
% __ONLY ONE__ keyword per line
