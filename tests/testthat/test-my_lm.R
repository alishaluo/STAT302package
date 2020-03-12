# within test-my_lm.R
test_that("my_lm works", {
  expect_is(my_lm(formula = lifeExp ~ gdpPercap + continent,
                  data = my_gapminder), "data.frame")
  expect_is(my_lm(formula = lifeExp ~ gdpPercap + continent,
                  data = my_gapminder)$Estimate, "numeric")
})
test_that("incorrect input throws error", {
  expect_error(my_lm(formula = lifeExp, data = my_gapminder))
  expect_error(my_lm(formula = dist ~ speed, data = my_gapminder))
})
