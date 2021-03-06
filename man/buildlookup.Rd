% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/detectroute_riverdistance.R
\name{buildlookup}
\alias{buildlookup}
\title{Build Lookup Tables for Fast Distance Computation}
\usage{
buildlookup(rivers)
}
\arguments{
\item{rivers}{The river network object to use}
}
\value{
A rivernetwork object, with a new list element, \code{$distlookup}, a
  list of three matrices.  Element \code{[i,j]} of each matrix corresponds to
  the route between segment \code{i} and \code{j}.  The
  \code{distlookup$middist} matrix gives the total distance of the "middle"
  of each route (between the starting and ending segments"), and the
  \code{distlookup$starttop} and \code{distlookup$endtop} matrices have value
  \code{TRUE}, \code{FALSE}, or \code{NA} if the segments at the beginning or
  end of the route are connected to the rest of the route at the top of the
  coordinate matrix, bottom of the coordinate matrix, or if the route is
  contained to just one segment, respectively. (See \link{rivernetwork}.)
}
\description{
Adds lookup tables for distance computation, dramatically
  reducing computation time.  It may take some time to calculate,
  particularly in a braided network.
}
\note{
This will add three n by n matrices to the river network object, which
  will be very large if the river network has many segments.

This function is called within \link{cleanup}, which is recommended in
  most cases.  It is also called within \link{buildsegroutes}, and will add
  lookup tables by default if there are fewer than 400 segments in the river
  network.

This function can still be called in the presence of a braided network, but all resulting distances used in subsequent analyses will be the shortest route.

If segment routes (\code{$segroutes}) are not present, this function may take a very long time to run.
}
\examples{
data(abstreams)

abstreams1 <- buildlookup(abstreams)
}
\author{
Matt Tyers
}

