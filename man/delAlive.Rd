% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils,redis.R
\name{delAlive}
\alias{delAlive}
\title{End a task liveness thread}
\usage{
delAlive()
}
\value{
Invoked for the side-effect of ending a maintenance thread for
a task liveness key, \code{NULL} is invisibly returned.
}
\description{
\code{setAlive()} and \code{delAlive()} support worker fault tolerance and are
only to be use internally by the package. It's safe to call \code{delAlive()}
multiple times.
}
\keyword{internal}
