# within my_t.test.R
test_that("t-test works", {
  expect_is(my_t.test(rnorm(10, 0, 1), alternative = "less", mu = 0), "list")
  expect_is(my_t.test(rnorm(10, 0, 1), alternative = "less", mu = 0)$p_value, "numeric")
})
