# within test-my_knn_cv.R
test_that("my_knn_cv works", {
  expect_is(my_knn_cv(train = my_gapminder[, c(4, 6)], cl = my_gapminder$country,
                      k_nn = 1, k_cv = 5), "list")
  expect_is(my_knn_cv(train = my_gapminder[, c(4, 6)], cl = my_gapminder$country, k_nn = 1,
                      k_cv = 5)$CV_error, "numeric")
})
test_that("incorrect input throws error", {
  expect_error(my_knn_cv(train = my_gapminder[, -5], cl = my_gapminder$lifeExp,
                         k_nn = 1, k_cv = 5))
  expect_error(my_knn_cv(train = my_gapminder[, -3], cl = my_gapminder$country,
                         k_nn = 1, k_cv = 5))
})
