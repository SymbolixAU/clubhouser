#' Create an iteration
#' 
#' @param name \code{chr} Required. The name of this Iteration.
#' @param start_date \code{chr} Required. The date this Iteration begins, e.g. 2019-07-01.
#' @param end_date \code{chr} Required. The date this Iteration ends, e.g. 2019-07-01.
#' @param description \code{chr} The description of the Iteration.
#' @param follower_ids \code{chr} A vector of UUIDs for any members you want to add as followers
#' @param base_url Clubhouse API url.  
#' @param config additional configuration to add to header
#' @param ch_token Clubhouse API token. 
#'
#'@examples
#'
#' \dontrun{
#'  
#' set_token(<mysecrettoken>)
#'
#' create_iteration(
#'   name = "demo iteration"
#'   , start_date = "2021-06-01"
#'   , end_date = "2021-06-30"
#'   , description = paste0( "# markdown H1 Title \n\n",
#'                           "This is a description. \n\n ",
#'                           "THis is a second paragraph."
#'   )
#' )
#' }
#' 
#' @import jsonify
#' 
#' @export
create_iteration <- function(
  name
  , start_date
  , end_date
  , description = ""
  , follower_ids = NA_character_
  , base_url = get_url()
  , config = list()
  , ch_token = get_token()
){
  
  json_req <- jsonify::to_json(
    list(
      name = name
      , start_date = start_date
      , end_date = end_date
      , description = description
      , follower_ids = follower_ids
    )
    , unbox = TRUE
  )

  #print( jsonify::pretty_json(json_req) )
  
  ch_POST(
    ch_url(ch_base_url = base_url
           , endpoint = "iterations"
           , ch_token = ch_token)
    , body = json_req
  )
  
  invisible(return(NULL))
  
}

