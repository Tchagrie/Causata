
\name{FocalPointQuery}
\alias{FocalPointQuery}
\alias{is.FocalPointQuery}
\alias{as.character.FocalPointQuery}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Build a focal point query.
}
\description{
The FocalPointQuery class is used to generate SQL queries for Causata.  The data in a focal point query is built around
a particular event in a customer profile.
}
\usage{
FocalPointQuery(focalpoint.event, 
  cardinality=if (length(event.attribute)) {"using.all.values"} else {"using.all.events"},
  event.attribute=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{focalpoint.event}{The event to be used as a focal point.}
  \item{cardinality}{This controls which records are returned when there are multiple events in a profile.
  The default settings will return one or more records for a profile.
  See the Details section below.}
  \item{event.attribute}{If supplied, the focal point will be at the time given on this event attribute of the given event.}
}
\details{
The FocalPointQuery object builds a focal point query for profile records.
A blank FocalPointQuery translates to the following:

\code{"SELECT * FROM Scenarios variable, `focalpoint.event` WHERE variable.focal_point = `focalpoint.event`.timestamp"}

This focal point query can be made more specific by adding variables with \code{WithVariables}, 
adding where clauses with \code{Where} or setting a row limit with \code{Limit}.
The SQL query can be generated with as.character, e.g. \code{as.character(FocalPointQuery("focalpoint.event"))}.

When a customer event stream is loaded, there may be multple events that match the focal point event and where clauses.  
In this case one or more profile records (rows) may be returned for a single customer.  
The cardinality argument defines how which records are output.

When there is no event.attribute specified, the legal values for this argument and their meanings are:
\itemize{
  \item \code{"using.all.events"} For each occurance of the focal point event (that match the where clauses) 
  there will be a customer record with the timestamp of that event as the focal point.
  \item \code{"using.oldest.event"} When multiple events match the focal point query, the event with the 
  smallest (oldest) timestamp is used to build the customer record.
  \item \code{"using.newest.event"} When multiple events match the focal point query, the event with the largest 
  (newest) timestamp is used to build the customer record.
}
  
When an event.attribute is specified, then the legal values for this argument and thier meanings are:
\itemize{
  \item \code{"using.all.values"} All values for the attribute on all match focal point events are used 
  to build customer records, with the value of those attributes as the focal point point for the record.
  \item \code{"using.earliest.value"} The value of the attribute on the event with the smallest 
  (earliest) timestamp is used as the focal point time.
  \item \code{"using.most.recent.value"} The value of the attribute on the event with the largest 
  (most recent) timestamp is used as the focal point time.
}
}
\value{
A FocalPointQuery object based on the supplied event (and optional event attribute).
}

\author{
David Barker (support@causata.com)
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{FocalPointQuery}}, 
\code{\link{Connect}}, 
\code{\link{WithVariables}}, 
\code{\link{Variables}}, 
\code{\link{Where}}, 
\code{\link{Limit}},
\code{\link{CausataData}}.
}
\examples{
# This example builds a query returning a profile at each purchase event 
# with a price greater than $30
query <- FocalPointQuery("purchase") + WithVariables(c("some", "variables")) + 
  Where("purchase-price$Same Session", GreaterThan(30)) + Limit(1000)
as.character(query)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ SQL }
% __ONLY ONE__ keyword per line
