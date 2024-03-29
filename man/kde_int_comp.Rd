% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kde_int_comp.R
\name{kde_int_comp}
\alias{kde_int_comp}
\title{Comparison of KDE Maps Across Specified Time Intervals}
\usage{
kde_int_comp(data, start1, end1, start2, end2)
}
\arguments{
\item{data}{Data frame of crime or RMS data. See provided Chicago Data Portal
example for reference}

\item{start1}{Beginning date for the first interval of comparison}

\item{end1}{Final date for the first interval of comparison}

\item{start2}{Beginning date for the second interval of comparison}

\item{end2}{Final date for the second interval of comparison}
}
\value{
Returns a \emph{shiny.tag.list} object which contains three leaflet
    widgets: a widget with the calculated KDE from interval 1, a widget with
    the calculated KDE from interval 2, and a widget with a raster of the
    net differences between the KDE (heat maps) of each specified interval.
}
\description{
This function calculates and compares the kernel density estimate
    (heat maps) of crime incident locations from two given intervals. The
    function returns a net difference raster which illustrates net changes
    between the spatial crime distributions across the specified intervals.
}
\examples{
#Using provided dataset from Chicago Data Portal:
data(crimes)
int_out <- kde_int_comp(crimes, start1="1/1/2017", end1="3/1/2017",
                                start2="1/1/2018", end2="3/1/2018")
}
\author{
Jamie Spaulding, Keith Morris
}
\keyword{dynamic}
\keyword{hplot}
\keyword{methods}
\keyword{spatial}
