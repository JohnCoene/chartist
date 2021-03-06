% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/options.R
\name{resp_ist}
\alias{resp_ist}
\title{Configure responsive options for chartist visualisation}
\usage{
resp_ist(p, query, width, height, low, high, chartPadding, ...)
}
\arguments{
\item{p}{a chartist object.}

\item{query}{responsive query.}

\item{width}{set fixed width in pixels or percent (i.e.: \code{300px}, \code{70\%}).}

\item{height}{set fixed height in pixels or percent
(i.e.: \code{300px}, \code{70\%}).}

\item{low}{lower bound of value.}

\item{high}{higher bound of value.}

\item{chartPadding}{padding around chart div.}

\item{...}{additional options.}
}
\description{
Configure responsive options for chartist visualisation
}
\examples{
mtcars$models <- row.names(mtcars)

mtcars \%>\%
    chart_ist(models) \%>\%
    add_ist(qsec) \%>\%
    resp_ist(query = "screen and (max-width: 640px)", low = 15,
        chartPadding = 50) \%>\%
    resp_ist(query = "screen and (min-width: 641px) and (max-width: 1024px)",
        chartPadding = 0)

}

