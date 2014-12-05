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
                  header = TRUE,
                  as.is = TRUE,
                  row.names = 1,
                  fileEncoding = "Windows-1250"))
                  
}
cat("Uvažam podatke o ekipah lige NHL...\n")
ekipe <- tabela1()

#TABELA 2

tabela2 <- function(){
  return(read.csv("podatki/leaders.csv", sep = ";",
                  header = TRUE,
                  as.is = TRUE,
                  row.names = 1,
                  fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o igralcih...\n")
igralci <- tabela2()

#TABELA 3

tabela3 <- function(){
  return(read.csv("podatki/PIT.csv", sep = ";",
                  header = TRUE,
                  as.is = TRUE,
                  row.names = 1,
                  fileEncoding = "Windows-1250"))
}
cat("Uvažam podatke o igralcih ekipe PIT...\n")
pit <- tabela3()