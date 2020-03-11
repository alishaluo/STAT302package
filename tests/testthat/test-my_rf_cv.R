# within test-my_rf_cv.R
test_that("my_rf_cv works", {
  expect_is(my_rf_cv(k = 5), "numeric")
  expect_is(my_rf_cv(k = 20), "numeric")
})
test_that("non-numeric input throws error", {
  expect_error(my_rf_cv(k = "a string"))
  expect_error(my_rf_cv(k = "a"))
})

