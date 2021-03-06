% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{ch_list_all}
\alias{ch_list_all}
\title{Get endpoint data}
\usage{
ch_list_all(
  endpoint = NULL,
  url = NULL,
  config = list(),
  ch_token = get_token(),
  response_type = "full"
)
}
\arguments{
\item{endpoint}{data to list. One of "categories", "epic-workflow", "epics",
"files", "labels", "linked-files", "members", "milestones", "projects",
"repositories", "teams", "workflows", "iterations"}

\item{url}{Clubhouse API url.  Defaults to API V2}

\item{config}{additional configuration to add to header}

\item{ch_token}{Clubhouse API token.}

\item{response_type}{either "full" (all data) or "minimal" (just "entity_type", "id",
"name", "description"). Defaults to "full"}
}
\description{
Get endpoint data
}
\examples{

\dontrun{

# Retrieve all projects
ch_list_all(endpoint = "projects")

# List epics then retrieve full details about the first one
df <- ch_list_all("epics", response_type = "minimal")
ch_get_one("epics", id = df[ 1, "id"] )
}

}
