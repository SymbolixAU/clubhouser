context("API wrappers")

httptest::without_internet({
    test_that("HTTP verb functions make requests", {
      httptest::expect_GET(ch_GET("http://httpbin.org/"))
      httptest::expect_PUT(ch_PUT("http://httpbin.org/"))
      httptest::expect_POST(ch_POST("http://httpbin.org/"))
        #httptest::expect_PATCH(ch_PATCH("http://httpbin.org/"))
      httptest::expect_DELETE(ch_DELETE("http://httpbin.org/"))
    })
    test_that("Our user-agent string is set", {
      httptest::expect_GET(
        httptest::expect_header(
                ch_GET("http://httpbin.org/"),
                "user-agent: clubhouser/0.1.0"
            )
        )
    })
})

httptest::with_mock_api({
  testthat::test_that("Successful requests are handled", {
    testthat::expect_identical(
            ch_GET("https://example.com/get"),
            list(success="Yes!")
        )
    })

  testthat::test_that("Bad requests return an error", {
    testthat::expect_error(ch_GET("https://example.com/404"),
            "Not Found")
    })
})
