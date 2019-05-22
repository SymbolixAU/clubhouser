context("Search stories function")

# need a token
tok <- "foo"



testthat::test_that("Can't send an invalid endpoint",{
  testthat::expect_error(
    ch_(endpoint = "badendpoint")
    )
  testthat::expect_error(
    ch_get_one(id = 123L, endpoint = "badendpoint")
  )
} )

testthat::test_that("Can't send an invalid response_type",{
  testthat::expect_error(
    ch_list_all(endpoint = "epic", response_type = "bad_choice")
  )
  testthat::expect_error(
    ch_list_all(id = 123L, endpoint = "epic", response_type = "bad_choice")
  )
} )


testthat::test_that("Must set one of url and endpoint", {
  testthat::expect_error(
    ch_list_all()
  )
  testthat::expect_error(
    ch_get_one(id = 123L)
  )
})

testthat::test_that("Can't set both url and endpoint", {
  testthat::expect_error(
    ch_list_all(endpoint = "epics", url = "https://someurl.com")
  )
  testthat::expect_error(
    ch_get_one(id = 123L, endpoint = "epics", url = "https://someurl.com")
  )
})

httptest::with_mock_api({
  test_that("We can list endpoint contents correctly", {
    
    # endpoint <-c("categories", "epics",
    #              "files", "labels", "linked-files",
    #              "milestones", "projects", "repositories",
    #              "teams")
    
    res <- ch_list_all(endpoint = "categories", ch_token = tok, response_type = "full")
    
    expect_is(res, "data.frame")
    expect_identical(res$archived, TRUE)
    expect_identical(res$color, "foo")
    expect_identical(res$created_at, "2016-12-31T12:30:00Z")
    expect_identical(res$entity_type, "foo")
    expect_identical(res$external_id, "foo")
    expect_identical(res$id, 123L)
    expect_identical(res$name, "foo")
    expect_identical(res$type, "foo")
    expect_identical(res$updated_at, "2016-12-31T12:30:00Z")
    
  })
  
  test_that("We can get one record correctly", {

    res <- ch_get_one(id = 123L, endpoint = "stories", ch_token = tok)
    
    expect_is(res, "list")
    expect_identical(res$id, 123L)
    expect_identical(length(res), 37L)
    
    nm <- c('app_url','archived','blocked','blocker','branches','comments','commits',
            'completed','completed_at','completed_at_override','created_at','deadline',
            'description','entity_type','epic_id','estimate','external_id','files',
            'follower_ids','id','labels','linked_files','mention_ids','moved_at','name',
            'owner_ids','position','project_id','requested_by_id','started','started_at',
            'started_at_override','story_links','story_type','tasks','updated_at',
            'workflow_state_id')
    expect_identical(names(res), nm)
    
    
  })
  
})


httptest::with_mock_api({
  test_that("empty endpoint fails nicely",{
    # I set up mock endpoint `labels` with token = "bar" to be empty
    tok2 <- "bar"
    testthat::expect_message(
    ch_list_all(endpoint = "labels", ch_token = tok2, response_type = "minimal")
    ,"Can't return minimal columns - no records")
    
  })
})
