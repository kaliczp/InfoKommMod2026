install.package("jsonlite") # Telepítés után már nem kell többször futtatni. Mehet ## a sor elejére.
library(jsonlite) # Csomag betöltése
## URL összeállítása
url <- paste0(
  "https://archive-api.open-meteo.com/v1/archive?",
  "latitude=47.68&",
  "longitude=16.58&",
  "start_date=2025-01-01&",
  "end_date=2025-12-31&",
  "daily=precipitation_sum&",
  "timezone=Europe%2FBudapest"
)
## Letöltés
rawadat <- fromJSON(url)
## A letöltött formátum lista formában
adat <- data.frame(Date = rawadat$daily$time, Prec = rawadat$daily$precipitation_sum)
## Az adatsor exportálás
write.csv2(adat, "OMadat.csv")
