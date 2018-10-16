
#' Search stories
#' 
#' @param query Search query.  See https://help.clubhouse.io/hc/en-us/articles/115005967026 for more detail on allowed search structure.
#' @param search_limit Maximum records to retrieve.  Defaults to all.
#' @param url Alternatively specify query as a url string. Useful if you want to use a different version of the API (default is V2)
#' @param config additional configuration to add to header
#' @param ch_token Clubhouse API token. 
#' 
#'
#'@examples
#'\dontrun{
#' # Search for the term "foo" anywhere in stories
#' ch_search_stories(query = "foo")
#' 
#' # Search for epic names that contain specified text
#' # Note - no whitespace areound the ":"
#' ch_search_stories(query = "epic:foo")
#' 
#' # Combine search terms with "AND" ("OR" combinations are not supported by the API V2)
#' # Note the whitespace between each filter
#' ch_search_stories(query = "epic:foo is:done type:bug")
#' 
#'
#' }
#' 
#' @export
ch_search_stories <- function( query,  
                        search_limit = NULL,
                        url = NULL,
                        config=list(),
                        ch_token = get_token()){
  
  
  if(is.null(endpoint) & is.null(url)) stop("Please specify one of url or endpoint")
  if(!is.null(endpoint) & !is.null(url)) stop("Please specify only one of full url or endpoint")
  
  # TODO add in checks for url structure 
  # TODO add in checks for the query structure??
  
  if(is.null(url)){ url <- ch_url(endpoint = "search/stories", query = query, ch_token = ch_token) }
  
  # TODO Loop through pages until you hit search_limit
  
  df <- ch_GET(url =  url, config = config)
  
  
  return(df)
  
}

