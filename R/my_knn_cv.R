#' k-Nearest Neighbors Cross Validation Function
#'
#' This function uses k-nearest neighbors cross validation to predict the output
#' class.
#'
#' @param train data frame input
#' @param  cl true class value of the training data
#' @param k_nn numeric input of the number of neighbors
#' @param k_cv numeric input of the number of folds
#' @keywords prediction
#'
#' @return A list with the predicted class, and a numeric output of the cross
#'   validation error
#'
#' @examples
#' my_knn_cv(train = [, -5], cl = iris$Species, k_nn = 1, k_cv = 5)
#' my_knn_cv(train = [, -1], cl = my_gapminder$country, k_nn = 5, k_cv = 5)
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  # randomly selects folds
  folds <- sample(rep(1:k_cv, length = n))
  # split data
  data <- data.frame(train, "split" = folds)
  for(i in 1:k_cv) {
    # X_i
    data_train <- data %>% filter(split != i)
    # X_i^*
    data_test <- data %>% filter(split == i)
    # Y_i
    cl_train <- cl[folds != i]
    # Y_i^*
    cl_test <- cl[folds == i]
    # remove split columns
    data_train$split <- NULL
    data_test$split <- NULL
    # predicts output class
    knn_output <- knn(train = data_train, test = data_test, cl = cl_train,
                      k = k_nn)
    # stores the proportion observations classified incorrectly
  }
  # stores output for full data
  class <- knn(train = train, cl = cl, test = train, k = k_nn)
  miss_rate <- (knn_output != class)
  # calculates average of the misclassication rate
  cv_err <- mean(miss_rate)
  # stores results into a list
  result <- list("class" = class, "CV_error" = cv_err)
  # returns list
  return(result)
}