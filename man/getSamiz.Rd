\name{getSamiz}
\alias{getSamiz}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
getSamiz(src, ts_name, vintage = "today", country = "all", transformation = "raw")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{src}{
%%     ~~Describe \code{src} here~~
}
  \item{ts_name}{
%%     ~~Describe \code{ts_name} here~~
}
  \item{vintage}{
%%     ~~Describe \code{vintage} here~~
}
  \item{country}{
%%     ~~Describe \code{country} here~~
}
  \item{transformation}{
%%     ~~Describe \code{transformation} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (src, ts_name, vintage = "today", country = "all", transformation = "raw") 
{
    header <- ("http://samizdata.it/timeseries/")
    if (vintage == "today") 
        URL <- paste(header, src, "/", country, "/", ts_name, 
            "?", "&transformation=", transformation, sep = "")
    else URL <- paste(header, src, "/", country, "/", ts_name, 
        "?", "&transformation=", transformation, "&vintage=", 
        vintage, sep = "")
    ts <- GET(URL)
    dates = vector("character")
    values = vector("double")
    dates <- as.Date(dates, "\%Y-\%m-\%d")
    if (ts$status_code == 200) {
        ts_list <- content(ts)
        data <- ts_list$data
        for (i in 1:length(data)) {
            dates <- c(dates, as.Date(data[[i]]$date, "\%Y-\%m-\%d"))
            values <- c(values, data[[i]]$value)
        }
        df <- data.frame(dates, values)
        names(df) <- c("DATE", toupper(ts_name))
        return(df)
    }
    else {
        print(content(ts, "text"))
        return(NULL)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
