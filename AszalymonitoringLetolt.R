install.package("jsonlite") # Telepítés után már nem kell többször futtatni. Mehet ## a sor elejére.

library(jsonlite) # Csomag betöltése
stationurl <- "https://aszalymonitoring.vizugy.hu/api.php?view=getstations"
rawstationlist <- fromJSON(stationurl)
str(rawstationlist) # Adatok struktúrája 1 elemű lista
## Az adsattábla (data.frame) kimentése
stationlist <- rawstationlist$entries
## Állomáslista exportálása csv-be
write.csv2(stationlist, "AszalyStations.csv")
