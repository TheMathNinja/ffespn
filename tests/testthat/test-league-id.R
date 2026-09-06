test_that("homegrown league is the default but remains overridable", {
  league_default <- eval(
    formals(ffespn_projections)$league_id,
    envir = environment(ffespn_projections)
  )
  expect_identical(league_default, "942845238")

  old <- options(ffespn.league_id = "123456")
  on.exit(options(old), add = TRUE)
  option_default <- eval(
    formals(ffespn_projections)$league_id,
    envir = environment(ffespn_projections)
  )
  expect_identical(option_default, "123456")
})
