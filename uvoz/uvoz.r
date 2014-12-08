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


#Dodajanje urejenostne spremenljivke

attach(igralci)
kategorije <- c("Vrhunski strelec", "Dober strelec", "Povprečen strelec", "Slab strelec")
naziv <- character(nrow(igralci))
naziv[G >= 25]<- "Vrhunski strelec"
naziv[G >=15 & G <25]<- "Dober strelec"
naziv[G >= 5 & G < 15]<- "Povprečen strelec"
naziv[G < 5]<- "Slab strelec"
Naziv <- factor(naziv, levels = kategorije, ordered = TRUE)
detach(igralci)
CHI <- data.frame(igralci, Naziv)


