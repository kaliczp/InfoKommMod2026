install.package("jsonlite") # Telepítés után már nem kell többször futtatni. Mehet ## a sor elejére.

library(jsonlite) # Csomag betöltése
stationurl <- "https://aszalymonitoring.vizugy.hu/api.php?view=getstations"
rawstationlist <- fromJSON(stationurl)
str(rawstationlist) # Adatok struktúrája 1 elemű lista
## Az adsattábla (data.frame) kimentése
stationlist <- rawstationlist$entries
## Állomáslista exportálása csv-be
write.csv2(stationlist, "AszalyStations.csv")

### Változó lekérés
paramurl <- paste0(
  "https://aszalymonitoring.vizugy.hu/api.php?view=",
  "getvariables"
)
## Lekérés
rawvariables <- fromJSON(paramurl)
str(rawvariables)
## Adattábla
variables.df <- rawvariables$entries
## Állomáslista exportálás
write.csv2(variables.df, "AszalyVariables.csv")

## Sopronkövesd ID
stationid <- "7EC0406D-93A8-4616-ABA7-2B01CAE6F66E"
