## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(rcrimeanalysis)
require(dplyr)

## ----setup, eval = FALSE------------------------------------------------------
#  # Install from CRAN
#  install.packages("rcrimeanalysis")
#  # Install Development Version
#  devtools::install_github("JSSpaulding/rcrimeanalysis")
#  
#  # After installation, load and attach the package
#  library(rcrimeanalysis)

## ----data---------------------------------------------------------------------
data("crimes")
dim(crimes)

## ----eval=FALSE---------------------------------------------------------------
#  library(ggmap)
#  ggmap::register_google("**CREDENTIALS HERE**")
#  addresses <- c("The White House, Washington DC", "Capitol Building, Washington DC")
#  geocode_address(addresses)

## -----------------------------------------------------------------------------
narcotics <- subset(crimes, crimes$primary_type == "NARCOTICS")
# Plot without Points
p1 <- narcotics %>% kde_map(pts = FALSE)
# Plot with Incident Points
p2 <- narcotics %>% kde_map()
leafsync::sync(p1,p2)

## -----------------------------------------------------------------------------
narco_repeats <- id_repeat(narcotics)
narco_repeats[2]

## ----fig.width=7, fig.height=5------------------------------------------------
narco_ts <- ts_month_decomp(narcotics, start = (2017))
plot(narco_ts)

## ----fig.width=7, fig.height=5------------------------------------------------
thefts <- subset(crimes, crimes$primary_type == "THEFT")
ts_forecast(thefts, start = c(2017, 1, 1))

## ----fig.width=7, fig.height=5------------------------------------------------
interval <- kde_int_comp(narcotics,
             start1="1/1/2017", 
             end1="3/1/2017", 
             start2="1/1/2018", 
             end2="3/1/2018")
interval

## ----fig.width=7, fig.height=5------------------------------------------------
crime_samp <- head(crimes, n = 1000)
out <- near_repeat_analysis(data = crime_samp, 
                            tz = "America/Chicago",
                            epsg = "32616")
igraph::plot.igraph(out[[5]],layout=igraph::layout.sphere)

## ----eval=FALSE---------------------------------------------------------------
#  near_repeat_eval(data = crime_samp,
#                   tz = "America/Chicago",
#                   epsg = "32616")

