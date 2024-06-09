most_recent_season <- function() {
  current_year <- as.numeric(format(Sys.Date(), "%Y"))
  ifelse(
    which(month.name == months(Sys.Date())) <= 8,
    current_year - 1,
    current_year

    )
}


get_leagues <- function(season = most_recent_season()) {

  leagues <- ffscrapr::sleeper_userleagues("rplain", season)

  leagues_list <- list()

  for( i in 1:nrow(leagues)) {
      tmp_name = tolower(gsub(" ", "_", leagues$league_name[i]))
      leagues_list[[tmp_name]] <- leagues$league_id[i]

    }

  return(leagues_list)

}

