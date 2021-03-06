% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary.R
\name{summary.rpv_Pool}
\alias{summary.rpv_Pool}
\title{summary.rpv_Pool}
\usage{
\method{summary}{rpv_Pool}(object, ...)
}
\arguments{
\item{object}{\code{rpv_Pool} object}

\item{...}{other arguments}
}
\description{
summary of rpv() simulation of the \code{Pool} class
}
\examples{
test <- rpv(object = Pool(), 
            n = 500,
            interest = Interest(t = 10, rate = 0.04))
summary(test)
}

