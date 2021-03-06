% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/my_rf_cv.R
\name{my_rf_cv}
\alias{my_rf_cv}
\title{Random Forest Cross Validation Function}
\usage{
my_rf_cv(k)
}
\arguments{
\item{k}{numeric input of the number of folds.}
}
\value{
numeric output of the CV MSE.
}
\description{
This function uses Random Forest Cross Validation to predict the output of
a target variable and calculate MSE.
}
\examples{
my_rf_cv(k = 5)
my_rf_cv(k = 2)

}
\keyword{prediction}
