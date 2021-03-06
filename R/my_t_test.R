#' T-test function
#'
#' This function performs a one-sample t-test.
#'
#' @param x numeric vector input of data.
#' @param alternative a string that determinates the null hypothesis.
#' @param mu numeric input of the null hypothesis mean.
#' @keywords prediction
#'
#' @return A list with the alternative hypothesis, numeric test value, and
#'    numeric p-value.
#'
#' @examples
#' my_t_test(x = rnorm(10, 0, 1), alternative = "two.sided", mu = 0)
#' my_t_test(my_gapminder$pop, alternative = "less", mu = 0)
#'
#' @import class magrittr stats
#' @export
my_t_test <- function(x, alternative, mu) {
  # gives the alternative hypothesis statements
  if(alternative == "two.sided") {
    alt <- c("true difference in means is not equal to", mu)
  }else if (alternative == "less") {
    alt <- c("true difference in means is less than", mu)
  }else if (alternative == "greater") {
    alt <- c("true difference in means is greater than", mu)
  } else {
    alt <- c("Error: invalid argument")
  }
  # calculates standard error
  se.t_test <- sd(x)/(sqrt(length(x)))
  # calculates test statistic
  test_stat <- ((mean(x) - mu)/se.t_test)
  # calculates degrees of freedom
  df <- (length(x)) - 1
  # if it is a two sided t-test, it will calculate the p value accordingly
  if(alternative == "two.sided") {
    p_val <- 2 * pt(abs(test_stat), df = df, lower.tail = FALSE)
  } else {
    # calculates for p value for a one-sided t-test
    p_val <- pt(abs(test_stat), df = df, lower.tail = FALSE)
  }
  # creates a list
  my_result <- list(
    "test statistic" = test_stat,
    "df" = df,
    "alternative" = alternative,
    "alternative hypothesis" = alt,
    "p_value" = p_val
  )
  # returns the resulting list
  return(my_result)
}
