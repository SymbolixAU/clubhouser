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
# # 
# 
# library(data.table)
# endp <- "epics"
# epic_cols <- c("id", "name", "state", "milestone_id")
# dt_allepics <- ch_list_all("epics", response_type = "full")[, epic_cols]
# setDT(dt_allepics)
# 
# dt_allepics
# 
# 
# str(res_ep)
# 
# # test search
# endpoint <- "search/stories"
# id <- NULL
# query <- "epic:foo"
# 
# test_url <- ch_url(endpoint = endpoint, query = query)
# res <- clubhouser:::ch_GET(test_url)
# str(res$data)
# dt_res <- as.data.table(res$data)
# dt_res
