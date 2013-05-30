\name{MergeLevels}
\alias{MergeLevels}
\alias{MergeLevels.factor}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Combines least-frequently occurring levels of a factor into an "Other" category.
}
\description{
Take a nominal variable and merge the least-frequently occurring levels into an Other category, 
to leave only max.levels distinct categories (including Other).
For example, if there are 15 levels in the data and we request max.levels = 10, 
then the leading 9 levels will be retained, and the least frequent 6 levels 
will be merged into Other.
}
\usage{
\method{MergeLevels}{factor}(this, max.levels, other.name="Other", \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{this}{A a factor, ie a nominal variable.}
  \item{max.levels}{
  The maximum number of levels required. eg If we request 10 levels, 
  then there will be 9 distinct levels, plus Other.
  max.levels must be at least 2. If max.levels is greater than the 
  number of levels in the data then no merging is done.}
  \item{other.name}{The merged levels will be assigned to a new level with the name provided.}
  \item{\dots}{Unused extra arguments.}
}
%\details{}
\value{
Returns a new factor with the smaller levels merged.
}

\author{
Jason McFall, Justin Hemann <support@causata.com>
}

\examples{
library(stringr)
f <- factor(str_split("a a a b b b c c c d e f g h", " ")[[1]])
# d,e,f,g,h are merged into Other
MergeLevels(f, max.levels=4) 
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ factor }
\keyword{ levels }
% __ONLY ONE__ keyword per line
