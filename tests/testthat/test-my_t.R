# within my_t.test.R
test_that("t-test works", {
  expect_match(my_t.test(rnorm(10, 0, 1), alternative = "less", mu = 0),
                t.test(rnorm(10, 0, 1), alternative = "less", mu = 0))
})
