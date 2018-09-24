context("API tokens")

test_that("API token is set", {
  
  reset_api()
  set_token("mytoken")
  expect_true( 
    getOption("clubhouser")[["ch_token"]] == "mytoken"
    )
})

test_that("url is changed with set_url", {
  
  reset_api()
  set_url("myurl")
  expect_true( 
    getOption("clubhouser")[["ch_base_url"]] == "myurl"
  )
})

test_that("Correct token is returned", {
  
  reset_api()
  set_token("mytoken")
  expect_true(
    get_token() == "mytoken"
  )
  
})
test_that("Correct url is returned", {
  
  reset_api()
  set_url("myurl")
  expect_true(
    get_url() == "myurl"
  )
  
})


test_that("default url is set", {
  
  reset_api()
  expect_true( 
    getOption("clubhouser")[["ch_base_url"]] == "https://api.clubhouse.io/api/v2"
  )
})

test_that("default token is NA", {
  
  reset_api()
  expect_true(
    is.na(getOption("clubhouser")[["ch_token"]] )
  )
})
