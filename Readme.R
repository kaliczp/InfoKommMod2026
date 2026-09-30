teszturl = "https://odp.met.hu/climate/observations_hungary/daily_rain/recent/HABP_1RD_13600_akt.zip"
## Fájl letöltés
download.file(teszturl, "P13600.zip", mode = "wb")
unzip("P13600.zip", exdir = tempdir())
adat <- read.table(file.path(tempdir(), "HABP_1RD_20260101_20260831_13600.csv"), sep = ";", head = TRUE)
sum(adat[,3])
