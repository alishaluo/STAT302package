# within test-my_t_test.R
test_that("t-test works", {
  expect_is(my_t_test(rnorm(10, 0, 1), alternative = "less", mu = 0), "list")
  expect_is(my_t_test(rnorm(10, 0, 1), alternative = "less", mu = 0)$p_value,
            "numeric")
})
test_that("incorrect input throws error", {
  expect_error(my_t_test(rnorm(10, 0, 1), alternative = 5, mu = "string"))
})
