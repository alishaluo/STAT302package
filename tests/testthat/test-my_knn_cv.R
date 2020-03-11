# within test-my_knn_cv.R
test_that("my_knn_cv works", {
  expect_is(my_knn_cv(train = iris[, -5], cl = iris$Species, k_nn = 1,
                      k_cv = 5), "list")
  expect_is(my_knn_cv(train = iris[, -5], cl = iris$Species, k_nn = 1,
                      k_cv = 5)$CV_error, "numeric")
})
test_that("incorrect input throws error", {
  expect_error(my_knn_cv(train = iris[, -5], cl = iris$Sepal.Length, k_nn = 1,
                         k_cv = 5))
  expect_error(my_knn_cv(train = iris[, -3], cl = iris$Species, k_nn = 1,
                         k_cv = 5))
})
