# Here's a good place to put your top-level package documentation

.onLoad <- function (lib, pkgname="clubhouser") {
    ## Put stuff here you want to run when your package is loaded
  if(is.null(getOption("clubhouser"))) {
    
    options <- list(
      ch_base_url="https://api.clubhouse.io/api/v2",
      ch_token=NA_character_
    )
    attr(options, "class") <- "clubhouse_api"
    options(clubhouser = options)
  }

}
