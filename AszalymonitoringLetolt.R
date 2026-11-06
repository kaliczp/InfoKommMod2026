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

### Adatlekérés
## Sopronkövesd ID
stationid <- "7EC0406D-93A8-4616-ABA7-2B01CAE6F66E"
dataurl <- paste0(
  "https://aszalymonitoring.vizugy.hu/api.php?view=",
  "getmeas",
  "&varid=",15,
  "&fromdate=",Sys.Date()-89,
  "&statid=",stationid
)
rawmeas <- fromJSON(dataurl)
str(rawmeas)
## Adattábla
meas.df <- rawmeas$entries[[1]]
str(meas.df)
meas.df$value <- as.numeric(meas.df$value)
## Állomáslista exportálás
write.csv2(meas.df, "AszalyMeas.csv", row.names = FALSE)

sum(meas.df$value)
