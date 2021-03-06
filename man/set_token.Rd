% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-settings.R
\name{set_token}
\alias{set_token}
\title{Set token}
\usage{
set_token(token)
}
\arguments{
\item{token}{Clubhouse API token}
}
\description{
Set the default token for use with the clubhouse API.
}
\details{
Using \code{set_token} allows you to set your API token once and it is then used for
all functions that access the API.

See https://app.clubhouse.io/settings/account/api-tokens to get your API token.
}
\examples{

set_token(token = "my_clubhouse_token")

}
