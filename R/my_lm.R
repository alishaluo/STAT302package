#' Linear model function
#'
#' This function fits a linear model to the given data.
#'
#' @param formula general function input from a set of data.
#' @param data data input.
#' @keywords inference
#'
#' @return A table with the calculated estimates, standard error, t-values, and
#'    p values
#'
#' @examples
#' my_lm(formula = dist ~ speed, data = cars)
#' my_lm(formula = lifeExp ~ gdpPercap + continent, data = my_gapminder)
#' @import class magrittr
#' @export
my_lm <- function(formula, data){
  # extracts the x matrix
  x <- model.matrix(formula, data)
  # extracts model frame object
  x_mat <- model.frame(formula, data)
  # extracts a y matrix (response matrix)
  y <- model.response(x_mat)
  # calculates degrees of freedom
  df_lm <- nrow(data) - ncol(data)
  # calcualtes the intercept variable
  intercept <- ((solve(t(x) %*% x)) %*% t(x) %*% y)
  # calculates variance(sigma) squared
  sigma <-sum(((y - (x %*% intercept))^2)/ df_lm)
  # calcualtes the matrix needed for the standard error
  vari <- sigma * (solve(t(x) %*% x))
  # calculates standard error
  se <- diag(sqrt(vari))
  # calculates t-value
  t_val <- c(intercept / se)
  # caluclates p-values, specifically for two-sided t-test
  p_val <- 2 * pt(abs(t_val), lower.tail = FALSE, df = df_lm)
  # creates a table of all the variables calculated above
  results_tab <- as.data.frame(cbind(intercept, se, t_val, p_val))
  # names the columns
  colnames(results_tab) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)" )
  # returns the resulting table
  return(results_tab)
}
