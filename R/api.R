#' Clubhouse api
#'
#' The default base function to allow generic api calls
#' @param verb the api verb from the httr package (e.g. GET)
#' @param url the full request url
#' @param config additional configuration to add to header
#' @param ... other parameters to pass on to httr api call
#' 
#' @importFrom httr GET PUT PATCH POST DELETE http_status
ch_api <- function (verb,
                    url,
                    config=list(), ...) {
  

  FUN <- get(verb, envir=asNamespace("httr"))
  resp <- FUN(url, ..., config=c(ch_config(), config))

  #check for errors
  if (resp$status_code > 201L)  {  # error
    msg <- httr::http_status(resp)$message
    stop(msg, call.=FALSE)
  } else { # return response
    return(resp)
  }
}

#' @importFrom httr add_headers
ch_config <- function () {
  httr::add_headers(`user-agent`=ua("clubhouser"),
                    `content-type`="application/json",
                    `http_version` = 1.1 # get around occasional http2 bug
                    )

}

#' @importFrom utils packageVersion
ua <- function (pkg) paste(pkg, as.character(packageVersion(pkg)), sep="/")


#' Clubhouse url
#' 
#' Function to construct urls for Clubhouse api calls
#' 
#' @param ch_base_url the base url. Defaults to V2 of API.
#' @param endpoint endpoint to retrieve (e.g. project, team, story)
#' @param id id of single record to be retrieved using `ch_get_one` function
#' @param ch_token Clubhouse API token. 
#' @param query optional query search term
#' 
#' 
#' @details 
#' This function constructs the url for each API call. \code{ch_token} 
#' may be input as function parameters or set once with \code{set_token}.
#' 
#' @export
ch_url <- function (ch_base_url = get_url(),
                    endpoint = NULL,
                    id = NULL,
                    ch_token = get_token(), 
                    query = NULL) {

  # example :
  # https://api.clubhouse.io/api/v2/teams/{team-public-id}?token=$CLUBHOUSE_API_TOKEN

  url <- paste0(ch_base_url,
                if(!is.null(endpoint)){"/"}, endpoint,
                if(!is.null(id)){"/"}, id,
                "?token=", ch_token,
                if(!is.null(query)){"&query="}, query
  )
  return(url)
}



#' @import jsonify
#' @importFrom httr content
ch_GET <- function (url, 
                    config=list(),  ...) {
  
  resp <- ch_api("GET", url, config, ...)

  if(length(resp) == 0) warning(
    "Empty list returned. Do you have data at this endpoint?")
  return( jsonify::from_json( httr::content(resp
                                            , as = "text"
                                            , encoding = "ISO-8859-1") ) )
  
}
  
ch_PUT <- function (url, ...) ch_api("PUT", url, ...)

ch_DELETE <- function (url, ...) ch_api("DELETE", url, ...)

ch_POST <- function (url, ...) ch_api("POST", url, ...)

# ch_PATCH <- function (url, ...) ch_api("PATCH", url, ...)
#
