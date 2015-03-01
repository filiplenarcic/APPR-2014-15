# obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
#                           "obcine", "C:/Programiranje/OB/OB.shp", mapa = "zemljevid",
#                           encoding = "Windows-1250")
# 
# # Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
# preuredi <- function(podatki, zemljevid) {
#   nove.obcine <- c()
#   manjkajo <- ! nove.obcine %in% rownames(podatki)
#   M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
#   names(M) <- names(podatki)
#   row.names(M) <- nove.obcine[manjkajo]
#   podatki <- rbind(podatki, M)
#   
#   out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$OB_UIME)[rank(zemljevid$OB_UIME)]), ]
#   if (ncol(podatki) == 1) {
#     out <- data.frame(out)
#     names(out) <- names(podatki)
#     rownames(out) <- rownames(podatki)
#   }
#   return(out)
# }
# 
# # Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
# druzine <- preuredi(druzine, obcine)
# 
# # Izračunamo povprečno velikost družine.
# druzine$povprecje <- apply(druzine[1:4], 1, function(x) sum(x*(1:4))/sum(x))
# min.povprecje <- min(druzine$povprecje, na.rm=TRUE)
# max.povprecje <- max(druzine$povprecje, na.rm=TRUE)
# 
# # Narišimo zemljevid v PDF.
# cat("Rišem zemljevid...\n")
# pdf("slike/povprecna_druzina.pdf", width=6, height=4)
# 
# n = 100
# barve = topo.colors(n)[1+(n-1)*(druzine$povprecje-min.povprecje)/(max.povprecje-min.povprecje)]
# plot(obcine, col = barve)
####################################################################################################################################

# 3. faza: Izdelava zemljevida

# Uvozimo funkcijo za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r")

# Uvozimo zemljevid.
cat("Uvažam zemljevid...\n")

USA <- uvozi.zemljevid("http://baza.fmf.uni-lj.si/states_21basic.zip",
                       "USA", "states.shp", mapa = "zemljevid")

# USA <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2/shp/USA_adm.zip",
#                        "USA", "USA_adm1.shp", mapa = "zemljevid",
#                        encoding = "Windows-1250")

# Funkcija, ki podatke preuredi glede na vrstni red v zemljevidu
preuredi <- function(podatki, zemljevid) {
  nove.USA <- c()
  manjkajo <- ! nove.USA %in% rownames(podatki)
  M <- as.data.frame(matrix(nrow=sum(manjkajo), ncol=length(podatki)))
  names(M) <- names(podatki)
  row.names(M) <- nove.USA[manjkajo]
  podatki <- rbind(podatki, M)
  
  out <- data.frame(podatki[order(rownames(podatki)), ])[rank(levels(zemljevid$NAME_1)[rank(zemljevid$NAME_1)]), ]
  if (ncol(podatki) == 1) {
    out <- data.frame(out)
    names(out) <- names(podatki)
    rownames(out) <- rownames(podatki)
  }
  return(out)
}

# Ker se podatki, ki jih bomo uporabljali nanašajo le na sklenjen del ZDA bomo ostala ozemlja Združenih držav na zemljevidu zanemarili.

nocemo <- c("Alaska", "Hawaii", "Puerto Rico", "U.S. Virgin Islands")
usastates <- USA[!(USA$STATE_NAME %in% nocemo),]
usastates$NAME_1 <- factor(usastates$STATE_NAME)

cat("PDF...\n")

pdf("slike/divizije.pdf")
# plot(usastates, 
#      col = ifelse(capitals[as.character(usastates$NAME_1),
#                            "State"] == "Pacific", "lightsteelblue2", 
#                   ifelse(capitals[as.character(usastates$NAME_1),
#                                   "State"] == "Central", "thistle2",
#                          ifelse(capitals[as.character(usastates$NAME_1),
#                                          "State"] == "Atlantic", "lightgoldenrod1",
#                                 ifelse(capitals[as.character(usastates$NAME_1),
#                                                 "State"] == "Metropolitan", "lightcyan1", "white")))))

barve.divizije <- c("Pacific" = "lightsteelblue2",
                    "Central" = "thistle2",
                    "Atlantic" = "lightgoldenrod1",
                    "Metropolitan" = "lightcyan1")
plot(usastates, 
     col = barve.divizije[capitals[as.character(usastates$NAME_1),
                                   "State"]], border = "grey")


losangeles <- NHLcities$city =="Los Angeles"
points(coordinates(NHLcities[c("long", "lat")]),
       pch = ifelse(losangeles, 15, 19),
       cex = ifelse(losangeles, 0.8, 0.5),
       col = ifelse(losangeles, "gold", "black"))

#Spremenjene koordinate in imena mest
koordinate <- coordinates(NHLcities[c("long", "lat")])
imena <- as.character(NHLcities$city)
rownames(koordinate) <- imena
names(imena) <- imena
koordinate["New York City",1] <- koordinate["New York City",1] + 1.5
koordinate["Los Angeles",2] <- koordinate["Los Angeles",2]+1.7
koordinate["Los Angeles",1] <- koordinate["Los Angeles",1]+0.7
koordinate["Anaheim",1] <- koordinate["Anaheim",1]+1.4
koordinate["Anaheim",2] <- koordinate["Anaheim",2]+0.2
koordinate["San Jose",1] <- koordinate["San Jose",1]+2.3
koordinate["San Jose",2] <- koordinate["San Jose",2]+0.3
koordinate["Tampa",1] <- koordinate["Tampa",1]+0.8
koordinate["St. Louis",1] <- koordinate["St. Louis",1]-1.2
koordinate["St. Louis",2] <- koordinate["St. Louis",2]+0.2
koordinate["St. Paul",1] <- koordinate["St. Paul",1]-0.4
koordinate["Sunrise",1] <- koordinate["Sunrise",1]+2
koordinate["Sunrise",2] <- koordinate["Sunrise",2]+0.3
koordinate["Chicago",2] <- koordinate["Chicago",2]+0.1
koordinate["Chicago",1] <- koordinate["Chicago",1]-1.2
koordinate["Detroit",2] <- koordinate["Detroit",2]+1.2
koordinate["Detroit",1] <- koordinate["Detroit",1]-1.7
koordinate["Boston",1] <- koordinate["Boston",1] + 2.8
koordinate["Boston",2] <- koordinate["Boston",2] + 1.4
koordinate["Washington",1] <- koordinate["Washington",1] -1.7
koordinate["Philadelphia",1] <- koordinate["Philadelphia",1] + 2.3
koordinate["Pittsburgh",2] <- koordinate["Pittsburgh",2] + 1.5
koordinate["Pittsburgh",1] <- koordinate["Pittsburgh",1] + 1.5
koordinate["Buffalo",2] <- koordinate["Buffalo",2] + 0.3
koordinate["Buffalo",1] <- koordinate["Buffalo",1] + 1.5

text(koordinate,labels=imena, cex=0.6, pos = 1, offset = 0.2, col = "black")
title("Zvezne države lige NHL po divizijah")
legend("bottomleft",
       legend=c("Pacific", "Central", "Atlantic", "Metropolitan"), col=c("lightsteelblue2","thistle2","lightgoldenrod1","lightcyan1"),
       lty = c("solid", "solid", "solid", "solid"),
       lwd = c(10, 10, 10, 10),
       bg = "white",
       title="Legenda")

dev.off()




# Zemljevid ZDA - primerjava uspešnosti zveznih držav v ligi NHL
goal <- preuredi(goal,usastates)
usastates$GPG <- goal$GPG
usastates$PPT <- goal$PPT

pdf("slike/state.pdf",paper="a4")
barve1 <- heat.colors(25)[25:1]

print(spplot(usastates, "GPG", col.regions = barve1,
             main = "Število zadetkov na tekmo po zveznih državah v sezoni 2013/14"))

barve2 <- topo.colors(150)[150:1]

print(spplot(usastates, "PPT", col.regions = barve2,
             main = "Število doseženih točk po zveznih državah v sezoni 2013/14"))


dev.off()






# Zemljevid sveta in razširjenost igralcev po svetu
pdf("slike/svet.pdf")
cat("Uvažam zemljevid 2...\n")
svet <- uvozi.zemljevid("http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/110m/cultural/ne_110m_admin_0_countries.zip",
                        "svet", "ne_110m_admin_0_countries.shp", mapa = "zemljevid",
                        encoding = "Windows-1250")

nocemo <- c("Antarctica")
svet <- svet[!(svet$continent %in% nocemo),]

m <- match(svet$name_long, rownames(nacionalnost))
razsirjenost <- nacionalnost[m,1]
n <- 4
q <- quantile(razsirjenost, (1:n)/n, na.rm = TRUE)
barve <- heat.colors(n)[n:1]
plot(svet, border = "dimgray", main = "Število igralcev lige NHL razvrščenih po narodnosti",
     col = barve[sapply(razsirjenost, function(x) which(x <= q)[1])])
legend("bottomleft",
       legend=c("Visok", "Srednje visok", "Nizek", "Zelo nizek"), 
       col=c("#FFFF80FF","#FFFF00FF","#FF8000FF","#FF0000FF"),
       lty = c("solid", "solid", "solid", "solid"),
       lwd = c(10, 10, 10, 10),
       bg = "white",
       title="Legenda - Delež vseh igralcev lige v posamezni državi")
dev.off()







