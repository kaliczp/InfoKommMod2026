## Forrás URL
teszturl = "https://odp.met.hu/climate/observations_hungary/daily_rain/recent/HABP_1RD_13600_akt.zip"
## Zip fájlnév változóból
zipfilename = "P13600.zip"
## Fájl letöltés
download.file(teszturl, zipfilename, mode = "wb")
# Fájl név kinyerése a zip fájlból, itt nincs kicsomagolás, csak listázás.
csvfile <- unzip(zipfilename, list = TRUE)$Name
## Kicsomagolás
unzip(zipfilename, exdir = tempdir())
## Adat importálás az adat nevű objektumba
adat <- read.table(file.path(tempdir(), csvfile), sep = ";", head = TRUE)
## Csapadékösszeg kiíratás a lekérdezett állomás ez ideig feltöltött adataira
sum(adat[,3])
