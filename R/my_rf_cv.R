#' Random Forest Cross Validation Function
#'
#' This function uses Random Forest Cross Validation to predict the output of
#' a target variable and calculate MSE.
#'
#' @param k numeric input of the number of folds.
#' @keywords prediction
#'
#' @return numeric output of the CV MSE.
#'
#' @examples
#' my_rf_cv(k = 5)
#' my_rf_cv(k = 2)
#'
#' @import class magrittr gapminder stats dplyr
#' @importFrom randomForest randomForest
#' @export
my_rf_cv <- function(k) {
  my_gapminder <- my_gapminder
  n <- nrow(my_gapminder)
  # selects folds randomly and splits data
  folds <- sample(rep(1:k, length = n))
  data <- data.frame(my_gapminder, "split" = folds)
  mse <- rep(NA, k)
  for(i in 1:k) {
    # X_i, training data
    data_train <- data %>% dplyr::filter(split != i)
    # X_i^*, testing data
    data_test <- data %>% dplyr::filter(split == i)
    # remove split columns
    data_train$split <- NULL
    data_test$split <- NULL
    # predicts the outcomes of lifeExp
    my_model <- randomForest(lifeExp ~ gdpPercap, data = data_train, ntree = 100)
    # predicts Sepal.length of the testing data
    my_pred <- predict(my_model, data_test[, -4])
    # calculates the average squared difference
    mse[i] <- mean((my_pred - data_test[, 4])^2)
  }
  return(mean(mse))
}

