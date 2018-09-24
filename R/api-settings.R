#' Set token
#' 
#' Set the default token for use with the clubhouse API.  
#' 
#' @param token Clubhouse API token
#' 
#' @details 
#' Using \code{set_token} allows you to set your API token once and it is then used for 
#' all functions that access the API. 
#' 
#' See https://app.clubhouse.io/settings/account/api-tokens to get your API token.  
#' 
#' @examples 
#' 
#' set_token(token = "my_clubhouse_token")
#' 
#' @export
set_token <- function(token){
  
  options <- getOption("clubhouser")
  options[["ch_token"]] <- token
  class(options) <- "clubhouse_api"
  options(clubhouser = options)
  invisible(NULL)

}

#' Set base url
#' 
#' Change the default API URL for use with the clubhouse API.  
#' 
#' @param url Clubhouse API URL
#' 
#' @details 
#' Using \code{set_url} allows you to change the API requests to point to a different API root.
#' By default \code{clubhouser} functions use the V2.0 API, "https://api.clubhouse.io/api/v2",
#' as the basis for all requests
#' 
#' If you want to access an different version of the API you will need to use the \code{set_url}
#' function to change the API root
#' 
#' @examples
#' 
#' # access the beta version of the API
#' set_url(url = "https://clubhouse.io/api/beta")
#' 
#' @export
set_url <- function(url){
  
  options <- getOption("clubhouser")
  options[["ch_base_url"]] <- url
  class(options) <- "clubhouse_api"
  options(clubhouser = options)
  invisible(NULL)
  
}


#' Get token
#' 
#' Retrieve user token
#' 
#' @export
get_token <- function(){
  
  ch_token <- getOption("clubhouser")[["ch_token"]]
  if(is.na(ch_token)){
    stop("Clubhouse API token is missing.  Please use set_token() to set it or include a non-null 'token' parameter in your function call.")
  }
  return(ch_token)
}


#' Get URL
#' 
#' Retrieve base API url
#' 
#' @export
get_url <- function(){
  
  ch_base_url <- getOption("clubhouser")[["ch_base_url"]]
  if(is.na(ch_base_url)){
    stop("Clubhouse API URL is missing.  Please use set_url() to set it or include a non-null 'url' parameter in your function call.")
  }
  return(ch_base_url)
}

#' Reset API options
#' 
#' Set API url to default and clear API token
#' 
#' @examples
#' 
#' set_token("mytoken") # set token
#' get_token()  # check value updated
#' reset_api()  # clear values
#' 
#' @export
reset_api <- function(){
  
  options <- list(
    ch_base_url="https://api.clubhouse.io/api/v2",
    ch_token=NA_character_
  )
  attr(options, "class") <- "clubhouse_api"
  options(clubhouser = options)
  invisible(NULL)
  
}
