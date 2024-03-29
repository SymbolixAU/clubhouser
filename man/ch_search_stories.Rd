% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search.R
\name{ch_search_stories}
\alias{ch_search_stories}
\title{Search stories}
\usage{
ch_search_stories(
  query,
  search_limit = 1000,
  url = NULL,
  config = list(),
  response_type = "summary",
  ch_token = get_token()
)
}
\arguments{
\item{query}{Search query.  See https://help.clubhouse.io/hc/en-us/articles/115005967026 for more detail on allowed search structure.}

\item{search_limit}{Maximum records to retrieve.  Defaults to 1000.}

\item{url}{Alternatively specify query as a url string. Useful if you want to use a different version of the API (default is V2)}

\item{config}{additional configuration to add to header}

\item{response_type}{either "full" (all data as a nested list) or
"summary" (flattened data frame with nested lists removed) or
"minimal" (just "entity_type", "id", "name", "description"). Defaults to "summary"}

\item{ch_token}{Clubhouse API token.}
}
\description{
Search stories
}
\examples{
\dontrun{
# Search for the term "foo" anywhere in stories
ch_search_stories(query = "foo")

# Search for epic names that contain specified text
# Note - no whitespace areound the ":"
ch_search_stories(query = "epic:foo")

# Combine search terms with "AND" ("OR" combinations are not supported by the API V2)
# Note the whitespace between each filter
ch_search_stories(query = "epic:foo is:done type:bug")


}

}
