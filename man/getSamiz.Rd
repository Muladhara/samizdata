\name{getSamiz}
\alias{getSamiz time series data}
\title{getSamiz}

\description{
Useful tools to work with time series data retrieved from Samizdata provider.
The function allows to easily retrieve and transform time series data from a variety of official sources.

It returns a data frame with two lists: \code{\link{date}(date)} and \code{\link{ts_name}}(obs.).
}

\usage{
getSamiz(src, ts_name, vintage='today', country='all', transformation='raw')
}


\arguments{
\item{src}{The source of the time series you want to download (e.g. "FRED","OECD", etc.)}
\item{ts_name}{The name of the time series.}
\item{vintage}{It allows to choose the version of a time series as of a specific point in time. 
Possible values are valid YYYY-MM-DD dates. The default value is today's date.}
\item{country}{For some sources the country is needed in the ISO country code format (e.g. "IT","US").}
\item{transformation}{It allows to apply mathematical transformations to time series values before downloading them. If no transformation is specified, then the values are the original ones (RAW). 

The possible values for the parameter 'transformation' are:

\bold{RAW}:  default

\bold{LOG}:  the base-10 log of the values

\bold{LAG}:  x[t]-x[t-1]

\bold{LAG2}:         x[t]-x[t-2]

\bold{LAGLOG}:       LOG(x[t])-LOG(x[t-1])

\bold{LAG2LOG}:      LOG(x[t])-LOG(x[t-2])

\bold{LAG12LOG}:    LOG(x[t])-LOG(x[t-12])

\bold{SW}:          LOG(x[t] - 2*LOG(x[t-1])+LOG(x[t-2])

\bold{LAG12LAGLOG}: LOG(x[t])-LOG(x[t-12])-LOG(x[t-1])-LOG(x[t-13])
}
}

\details{
The function 
\code{\link{getSamiz}} allows to download data directly from the Samizdata provider.

The values for the \code{\link{source}}, \code{\link{ts_name}}, \code{\link{country}}, \code{\link{transformation}} are case-insensitive.
}

\references{
\url{http://www.samizdata.it/api_doc.html#R}
}

\examples{
require('stats','samizdata')

# download from the source 'fred' the time series 'gdp' 
x <- getSamiz("fred", "gdp")


# download from the source 'fred' the time series 'gdp' at the vintage date '2015-07-01'
x <- getSamiz("fred", "gdp", vintage="2015-07-01")


# download from the source 'worldbank' the time series 'ic.tax.totl.cp.zs', 
# for the country Albania 'AL', with the transformation 'log'
x <- getSamiz("worldbank", "ic.tax.totl.cp.zs", country="AL", transformation="log")


# download from the source 'ecb' the time series 'gst_a_fi_n_b0x13_m8v_b1300_sa_e'  
# at the transformation 'log'
x <- getSamiz("ecb", "gst_a_fi_n_b0x13_m8v_b1300_sa_e", transformation="log")
}



