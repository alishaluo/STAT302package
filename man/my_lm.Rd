% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_lm.R
\name{my_lm}
\alias{my_lm}
\title{Linear model function}
\usage{
my_lm(formula, data)
}
\arguments{
\item{formula}{general function input from a set of data.}

\item{data}{data input.}
}
\value{
A table with the calculated estimates, standard error, t-values, and
   p values
}
\description{
This function fits a linear model to the given data.
}
\examples{
my_lm(formula = lifeExp ~ gdpPercap + continent, data = my_gapminder)

}
\keyword{inference}
