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
colnames(ekipe) <- c("GP", "W", "L", "OT", "P", "ROW", "HROW", "RROW", "P%", "G/GP",
  "GA/GP", "5-5 F/A", "PP%", "PK%", "S/GP", "SA/GP", "Sc 1%",
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
colnames(igralci) <- c("Team", "Pos", "GP", "G", "A", "P", "+/-", "PIM",
                       "PPG", "PPP", "SHG", "SHP", "GW", "OT",
                       "S", "S%", "TOI/GP", "Shift/GP", "FO%")


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


