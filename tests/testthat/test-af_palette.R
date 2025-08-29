test_that("Correct value returned", {
  expect_equal(
    af_palette(palette_type = "af")(6),
    unname(af_colour_palettes$categorical)
  )
  expect_equal(
    af_palette(palette_type = "af")(3),
    unname(af_colour_palettes$categorical[1:3])
  )
  expect_equal(
    af_palette("categorical2", colour_names = TRUE)(2),
    af_colour_palettes$categorical2
  )
  expect_equal(
    af_palette("main2", colour_names = TRUE)(2),
    af_colour_palettes$main2
  )
  expect_equal(
    af_palette("main6", colour_names = TRUE)(5),
    af_colour_palettes$main6[1:5]
  )
  expect_equal(
    af_palette("sequential", colour_names = TRUE)(3),
    af_colour_palettes$sequential
  )
  expect_equal(
    af_palette("focus", reverse = TRUE)(2),
    unname(rev(af_colour_palettes$focus))
  )
})

test_that("Error if invalid palette name", {
  expect_error(af_palette("invalid")(2))
  expect_error(af_palette("af_main_palette")(2))
})

test_that("Error if too many colours requested", {
  expect_error(af_palette("categorical")(7))
  expect_error(af_palette("categorical2")(3))
  expect_error(af_palette("main")(5))
  expect_error(af_palette("sequential")(10))
  expect_error(af_palette("focus")(3))
  expect_error(af_palette("main", palette_type = "af")(5))
})

test_that("Use `categorical2` if two colours required.", {
  expect_equal(
    af_palette("categorical", palette_type = "af")(2),
    unname(af_colour_palettes$categorical2)
  )
})
