# # # 2. faza: Uvoz podatkov
# # 
# # # Funkcija, ki uvozi podatke iz datoteke druzine.csv
# uvoziDruzine <- function() {
#   return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
#                       row.names = 1,
#                       col.names = c("obcina", "en", "dva", "tri", "stiri"),
#                       fileEncoding = "Windows-1250"))
# }
# 
# # Zapišimo podatke v razpredelnico druzine.
# cat("Uvažam podatke o družinah...\n")
# druzine <- uvoziDruzine()
# 
# # Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# # potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# # datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# # 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# # fazah.
# 
# 
# #TABELA 1

tabela1 <- function(){
  return(read.csv("podatki/NHLekipe.csv", sep = ";",
                  row.names = 1,
                  header = TRUE,
                  as.is = TRUE,
                  fileEncoding = "Windows-1250"))
  
}
cat("Uvažam podatke o ekipah lige NHL...\n")
ekipe <- tabela1()
colnames(ekipe) <- c("GP", "W", "L", "OT", "P", "ROW", "HROW", "RROW", "P%", "GGP",
  "GA/GP", "5-5 F/A", "PPperc", "PK%", "S/GP", "SA/GP", "Sc 1%",
  "Tr 1st%", "Ld 1%", "Ld 2%", "OS%", "OSB%", "FO%")


#TABELA 2

tabela2 <- function(){
  return(read.csv("podatki/CHI.csv", sep = ";",
                  row.names = 1,
                  header = TRUE,
                  as.is = TRUE,
                  fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o igralcih...\n")
igralci <- tabela2()
colnames(igralci) <- c("Coutry", "Birth City", "Team", "Pos", "GP", "G", "A", "P", "+/-", "PIM",
                       "PPG", "PPP", "SHG", "SHP", "GW", "OT",
                       "S", "FO%", "TOI/GP")


#Dodajanje urejenostne spremenljivke

attach(igralci)
kategorije <- c("Vrhunski strelec", "Dober strelec", "Povprečen strelec", "Slab strelec")
naziv <- character(nrow(igralci))
naziv[G >= 25]<- "Vrhunski strelec"
naziv[G >=13 & G <25]<- "Dober strelec"
naziv[G >= 4 & G < 13]<- "Povprečen strelec"
naziv[G < 4]<- "Slab strelec"
Naziv <- factor(naziv, levels = kategorije, ordered = TRUE)
detach(igralci)
CHI <- data.frame(igralci, Naziv)

# TABELA ameriških mest, ki gostijo tekme lige NHL in njihove koordinate.

tabela3 <- function(){
  return(read.csv("podatki/NHLcities.csv", sep = ",",
                  
                  header = TRUE,
                  as.is = TRUE,
                  fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o koordinatah mest...\n")
NHLcities <- tabela3()

# TABELA s podatki zveznih držav (samo USA)

tabela4 <- function(){
  return(read.csv("podatki/NHLstate.csv", sep = ",",
                  
                  header = TRUE,
                  as.is = TRUE,
                  fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o NHL states...\n")
NHLstates <- tabela4()



uvozi <- function() {
  return(read.table("podatki/nationality.csv", sep = ";", as.is = TRUE, header=TRUE,
                    na.strings="-", row.names=1,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico.
cat("Uvažam podatke o številu igralcev po nacionalnosti...\n")
nacionalnost <- uvozi()


uscap <- function() {
  return(read.table("podatki/uscapitals.csv", sep = ",", as.is = TRUE, header=TRUE,
                    row.names=1,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico.
cat("Uvažam podatke o številu glavnih mestih ameriških zveznih držav...\n")
uscapitals <- uscap()

attach(uscapitals)
kategorije <- c("Pacific", "Central", "Atlantic", "Metropolitan")
naziv <- character(nrow(uscapitals))
naziv[rownames(uscapitals)=="California"]<- "Pacific"
naziv[rownames(uscapitals)=="Arizona"]<- "Pacific"
naziv[rownames(uscapitals)=="Illinois"]<- "Central"
naziv[rownames(uscapitals)=="Colorado"]<- "Central"
naziv[rownames(uscapitals)=="Texas"]<- "Central"
naziv[rownames(uscapitals)=="Minnesota"]<- "Central"
naziv[rownames(uscapitals)=="Tennessee"]<- "Central"
naziv[rownames(uscapitals)=="Missouri"]<- "Central"
naziv[rownames(uscapitals)=="Massachusetts"]<- "Atlantic"
naziv[rownames(uscapitals)=="Michigan"]<- "Atlantic"
naziv[rownames(uscapitals)=="Florida"]<- "Atlantic"
naziv[rownames(uscapitals)=="North Carolina"]<- "Metropolitan"
naziv[rownames(uscapitals)=="Ohio"]<- "Metropolitan"
naziv[rownames(uscapitals)=="New York"]<- "Metropolitan"
naziv[rownames(uscapitals)=="North Carolina"]<- "Metropolitan"
naziv[rownames(uscapitals)=="Pennsylvania"]<- "Metropolitan"
naziv[rownames(uscapitals)=="North Carolina"]<- "Metropolitan"
naziv[rownames(uscapitals)=="District of Columbia"]<- "Metropolitan"



State <- factor(naziv, levels = kategorije, ordered = TRUE)
detach(uscapitals)
capitals <- data.frame(uscapitals, State)



######################################################################

goals <- function() {
  return(read.table("podatki/goals.csv", sep = ";", as.is = TRUE, header=TRUE,
                    row.names=1,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico.
cat("Uvažam podatke...\n")
goal <- goals()

##################################################################################
salary_uvoz <- function() {
  return(read.table("podatki/place.csv", sep = ";", as.is = TRUE, header=TRUE,
                    fileEncoding = "Windows-1250"))
  
}

# Zapišimo podatke v razpredelnico.
cat("Uvažam podatke...\n")
salary <- salary_uvoz()


########################################################

tabela2ekipe <- function(){
  return(read.csv("podatki/NHLekipe2.csv", sep = ";",
                  row.names = 1,
                  header = TRUE,
                  as.is = TRUE,
                  fileEncoding = "Windows-1250"))
  
}
cat("Uvažam podatke o ekipah lige NHL...\n")
ekipe2 <- tabela2ekipe()
colnames(ekipe2) <- c("GP", "W", "OT", "P", "ROW", "HROW", "RROW", "P%", "G/GP",
                     "5-5 F/A", "PP%", "PK%", "S/GP", "Sc 1%",
                     "Tr 1st%", "OS%", "OSB%", "FO%")