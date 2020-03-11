# within test-my_lm.R
test_that("my_lm works", {
  expect_is(my_lm(formula = dist ~ speed, data = cars), "data.frame")
  expect_is(my_lm(formula = dist ~ speed, data = cars)$Estimate, "numeric")
})
test_that("incorrect input throws error", {
  expect_error(my_lm(formula = dist, data = cars))
  expect_error(my_lm(formula = dist ~ speed, data = my_gapminder))
})
