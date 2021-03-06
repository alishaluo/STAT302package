% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_t_test.R
\name{my_t_test}
\alias{my_t_test}
\title{T-test function}
\usage{
my_t_test(x, alternative, mu)
}
\arguments{
\item{x}{numeric vector input of data.}

\item{alternative}{a string that determinates the null hypothesis.}

\item{mu}{numeric input of the null hypothesis mean.}
}
\value{
A list with the alternative hypothesis, numeric test value, and
   numeric p-value.
}
\description{
This function performs a one-sample t-test.
}
\examples{
my_t_test(x = rnorm(10, 0, 1), alternative = "two.sided", mu = 0)
my_t_test(my_gapminder$pop, alternative = "less", mu = 0)

}
\keyword{prediction}
