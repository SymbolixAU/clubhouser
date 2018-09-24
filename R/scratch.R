# library(clubhouser)
# 
# set_token(Sys.getenv("CLUBHOUSE_TOKEN"))
# 
# endpoint <- "epics"
# 
# df <- ch_list_all("epics", response_type = "minimal")
# ch_get_one("epics", id = df[ 1, "id"] )


# "epic-workflow", 
# 
#
# endpoint <-c("categories", "epics",
#              "files", "labels", "linked-files",
#              "milestones", "projects", "repositories",
#              "teams")
# 
# for (e in endpoint){
#   print(e)
# 
#   df <- ch_list_all(e, response_type = "minimal")
# 
#   df_one <- ch_get_one(id = df[1, "id"], e)
#   print(head(df, n=1))
# }
# 

# 
# df <- ch_list_all("members",response_type = "minimal")
# uuid <- df[2, "id"]
# df_one <- ch_get_one("members", id = uuid)
# names(df)
# head(df, n=1)
# 
# my_url <- "https://api.clubhouse.io/api/v2/members/5a4c0143-4fa8-486e-937a-d32b7e4e0853?token=5a95ff23-e461-45f5-aadc-dfc8d2a9f187"
# df_tmp <- ch_GET(url = my_url)
# str(df_tmp)


# 
# 
# df <- ch_list_all("members",response_type = "minimal")


# getOption("clubhouser")
# get_url()
# get_token()
# 
# 
# library(httr)
# 
# ch_base_url <- get_url()
# ch_token <-  get_token()
# endpoint <- "teams"
# 
# ch_url(endpoint = endpoint, id = NULL)
# res <- GET(ch_url(endpoint = endpoint, id = NULL), config = ch_config() )
# res <- content(res, as = "parsed")
# 
# length(res)
# str(res[[1]])
# 
# 
# res <- GET(ch_url(endpoint = endpoint, id = 1), config = ch_config() )
# res <- content(res, as = "text")
# str(res)
# str(jsonlite::fromJSON(res))
# sapply(jsonlite::fromJSON(res), function(x){x[["entity_type"]]})
# 
# jsonlite::fromJSON(res)[["entity_type"]]  
# 
# 
#   
#   [,c("entity_type", "id", "name", "description")]})
# 
# lapply( jsonlite::toJSON( content(res, as = "text") ), 
#         function(x){
#           df <- data.frame(entity_type = x$entity_type,
#                            id = x$id,
#                            name = x$name,
#                            description = x$description) })
# 
# resjs <- jsonlite::fromJSON( ch_url(endpoint = endpoint, id = 1) )
# str(resjs)
# 
# 
# str(res)
# 
