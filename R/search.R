
#' Search stories
#'
#' @param query Search query.  See https://help.clubhouse.io/hc/en-us/articles/115005967026 for more detail on allowed search structure.
#' @param search_limit Maximum records to retrieve.  Defaults to 1000.
#' @param url Alternatively specify query as a url string. Useful if you want to use a different version of the API (default is V2)
#' @param config additional configuration to add to header
#' @param response_type either "full" (all data as a nested list) or 
#' "summary" (flattened data frame with nested lists removed) or 
#' "minimal" (just "entity_type", "id", "name", "description"). Defaults to "summary"
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
                        search_limit = 1000,
                        url = NULL,
                        config=list(),
                        response_type = "summary",
                        ch_token = get_token()){


  match.arg(response_type, c("full", "summary", "minimal"))
  # TODO add in checks for url structure
  # TODO add in checks for the query structure??

  
  if(is.null(url)){ 

    url <- ch_url(endpoint = "search/stories", 
                  query = query, ch_token = ch_token) 
  }
  
  res <- ch_GET(url =  url, config = config)
  
  
  if( length(res[["data"]]) == 0){
    message("Query result empty")
    return(NULL)
  }
  
  lst <- list()
  lst[[1]] <- as.data.frame( res$data,row.names = NULL )
  
  nrec <- nrow(lst[[1]]) 
  i <- 2
  while( length(res[["next"]]) == 1 & nrec < search_limit){
    
    url <- paste0( "https://api.clubhouse.io", res[["next"]], 
                   "&token=", ch_token)
    res <- ch_GET(url =  url, config = config)
    lst[[i]] <- as.data.frame( res$data, row.names = NULL  )
    
    nrec <- nrec+nrow(lst[[i]])
    i <- i+1
  }
  
  # return data
  switch (response_type,
          full = return(lst),
          summary = {
            cols <- c('description', 'archived', 'started', 'entity_type',  'story_type', 
                      'workflow_id', 'completed_at_override', 'started_at', 
                      'completed_at', 'name', 'completed',  'blocker', 'epic_id', 
                      'requested_by_id', 'iteration_id', 'started_at_override', 
                      'group_id', 'workflow_state_id', 'updated_at',  'external_id', 
                      'id', 'estimate', 'position', 'blocked', 'project_id', 'deadline', 
                      'created_at', 'moved_at', 'lead_time', 'cycle_time')
            
            df <- do.call("rbind", lapply(lst, "[", cols) ) 
            if(nrow(df) > search_limit){
              return(df[1:search_limit,])
            } else{
            return(df)
            }
          }, 
          minimal = {
            
            cols <- c("entity_type", "id", "name", "description")
            df <- do.call("rbind", lapply(lst, "[", cols) ) 
            if(nrow(df) > search_limit){
              return(df[1:search_limit,])
            } else{
              return(df)
            }
          }
  )

}

