# 2. faza: Uvoz podatkov

# Funkcija, ki uvozi podatke iz datoteke druzine.csv
uvoziDruzine <- function() {
  return(read.table("podatki/druzine.csv", sep = ";", as.is = TRUE,
                      row.names = 1,
                      col.names = c("obcina", "en", "dva", "tri", "stiri"),
                      fileEncoding = "Windows-1250"))
}

# Zapišimo podatke v razpredelnico druzine.
cat("Uvažam podatke o družinah...\n")
druzine <- uvoziDruzine()

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.


#tabela 1

uvozi1 <- function(){
  return(read.csv("podatki/tabela1.csv", header = FALSE sep = ";", as.is = TRUE, 
                  row.names = 1), na.strings = "NA", skip = 3,
         col.names = c("Dejavnost", "Regija", "Prihodki od prodaje (1000 EUR) 08", "Prihodki od prodaje (1000 EUR) 09", "Prihodki od prodaje (1000 EUR) 10", "Prihodki od prodaje (1000 EUR) 11", "Prihodki od prodaje (1000 EUR) 12", 
                       "Plače (1000 EUR) 08", "Plače (1000 EUR) 09" "Plače (1000 EUR) 10", "Plače (1000 EUR) 11", "Plače (1000 EUR) 12", 
                       "Zaposleni 08", "Zaposleni 09", "Zaposleni 10", "Zaposleni 11", "Zaposleni 12"), 
         fileEncoding = "Windows-1250"
}
cat("Uvažam podatke o kohezijskih regijah podjetij po dejavnosti...\n")
podjetjaRegija <- uvozi1()