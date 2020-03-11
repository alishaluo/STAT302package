#' Random Forest Cross Validation Function
#'
#' This function uses Random Forest Cross Validation to predict the output of
#' a target variable and calculate MSE.
#'
#' @param k numeric input of the number of folds.
#' @keywords predction
#'
#' @return numeric output of the CV MSE.
#'
#' @examples
#' my_rf_cv(k = 5)
#' my_rf_cv(k = 1)
#' @import randomForest
#' @export
my_rf_cv <- function(k) {
  # selects folds randomly and splits data
  folds <- sample(rep(1:k, length = n))
  data <- data.frame(my_gapminder, "split" = folds)
  for(i in 1:k) {
    # X_i, training data
    data_train <- data %>% filter(split != i)
    # X_i^*, testing data
    data_test <- data %>% filter(split == i)
    # predicts the outcomes of Sepal.length
    my_model <- randomForest(lifeExp ~ gdpPercap, data = data_train, ntree = 100)
    # predicts Sepal.length of the testing data
    my_pred <- predict(my_model, data_test[, -1])
    # calculates the average squared difference
    mse <- (my_pred - data[, 1])^2
    sum_mse <- rep(mse)
  }
  return(mean(sum_mse))
}
