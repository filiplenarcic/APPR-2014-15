# 4. faza: Analiza podatkov

# Uvozimo funkcijo za uvoz spletne strani.
source("lib/xml.r")

# # Preberemo spletno stran v razpredelnico.
# cat("Uvažam spletno stran...\n")
# tabela <- preuredi(uvozi.obcine(), obcine)
# 
# # Narišemo graf v datoteko PDF.
# cat("Rišem graf...\n")
# pdf("slike/naselja.pdf", width=6, height=4)
# plot(tabela[[1]], tabela[[4]],
#      main = "Število naselij glede na površino občine",
#      xlab = "Površina (km^2)",
#      ylab = "Št. naselij")
# dev.off()

#######################################################################################################

# # CLUSTERING
# 
# data <- CHI
# data$Team <- NULL
# data$Pos <- NULL
# data$Naziv <- NULL
# data$Coutry <- NULL
# data$Birth.City <- NULL
# data$FO. <- NULL
# data$TOI.GP <- NULL
# 
# data1 <- scale(data)
# 
# #Narišemo grafe
# 
# rezultati <- kmeans(data1, centers = 3)
# center <- rezultati$centers
# skupina <- rezultati$cluster
# barve <- c("red", "green", "blue")
# 
# pdf("slike/clustering_1.pdf")
# 
# 
# plot(data[,"P"],data[,"X..."], col = barve[skupina],
#      xlab = "Število točk", ylab = "+/-",
#      main = "Razvrščanje - Odvisnost števila točk in +/-")
# 
# # plot(iris2[c("G", "X...")], col = rezultati$cluster)
# # points(rezultati$centers[,c("G", "X...")], col = 1:3, 
# #        pch = 8, cex=2)
# 
# dev.off()
# 
# 
# pdf("slike/clustering_2.pdf")
# plot(data[,"G"],data[,"S"], col = barve[skupina],
#      xlab = "Število zadetkov", ylab = "Število strelov",
#      main = "Razvrščanje - Odvisnost števila golov in število strelov")
# dev.off()

#########################################################################################################

# Napovedovanje

pdf("slike/place.pdf")

leto <- salary$YEAR
place <- salary$AVERAGE.SALARY/1000000

plot(leto, place, xlab = "Leto", ylab = "Plače v mio $", main = "Linearna, kvadratna in gam metoda")

legend(2000, 1, c("Linerana metoda", "Gam metoda"), lty=c(1,1), 
       col = c("blue", "green"))

#Napišemo funkcijo za linearno rast

linearna <- lm(place ~ leto)
abline(linearna, col="blue")

#Preverimo če so plače kvadratna funkcija

kvadratna <- lm(place ~ I(leto^2) + leto)
# curve(predict(kvadratna, data.frame(leto=x)), add = TRUE, col = "red")  

#Loess model za primerjavo (model loess uporablja lokalno prilagajanje)

loess <- loess(place ~ leto)

# Gam model
library(mgcv)
gam <- gam(place~s(leto))
curve(predict(gam, data.frame(leto=x)), add = TRUE, col = "green")
#Pogledamo ostanke pri modelih. Tisti, ki ima manjši ostanek je bolj natančen

vsota.kvadratov <- sapply(list(linearna, kvadratna, loess, gam), function(x) sum(x$residuals^2))
# najmanjša vrednost je z metodo gam - 0.44273517 0.44272328 0.26843681 0.06716553

dev.off()
################################

#Narisali bomo napoved za rast plač do leta 2030 po modelpo treh modelih - linearni, kvadratni in gam

pdf("slike/napoved.pdf")

plot(salary$YEAR, place, xlim = c(1989, 2040), ylim = c(0, 10), 
     xlab = "Leto", ylab = "Plače v mio $",
     main = "Napovedana rast plač igralcev lige MLB")     
abline(h = 3.818923,col = "black", lwd = 1.5, lty = 1)
abline(h = 5.98,col = "black", lwd = 1.5, lty = 1)
abline(h = 7.3,col = "black", lwd = 1.5, lty = 1)

# Presečišča

points(2030, 5.98,  col = "black", pch = 21)
points(2030, 7.3,  col = "black", pch = 21)

# V presečiščih potegnemo navpične črte

abline(v=2014, col = "magenta", lty = 1)
abline(v=2030, col = "darkblue", lty = 1)
abline(v=2040, col = "lightblue2", lty = 1)

napoved <- function(x,model){predict(model, data.frame(leto=x))}

curve(napoved(x, linearna), add= TRUE, lwd = 1.5, col = "blue")
# curve(napoved(x, kvadratna), add = TRUE, lwd = 1.5, col = "red")
curve(napoved(x, gam), add=TRUE, col="green")
#curve(napoved(x, loess), add = TRUE, lwd = 1.5, col = "black")


# Legenda
legend(2015, 3, c("Linearna", "Gam"),
       lty=c(1,1), col = c("blue", "green"))

dev.off()

#################################################################################################
# Hierarhično razvrščanje


pdf("slike/hierarhija.pdf")

X <- scale(as.matrix(ekipe[1:18]))
t <- hclust(dist(X), method = "ward.D")

plot(t, hang=-1, cex=0.4, main = "Skupine klubov")

legend("topright", 
       c("Skupina 1", "Skupina 2","Skupina 3"),
       lty=c(1,1,1), col = c("blue","green","red"))

rect.hclust(t,k=3,border=c("blue","red","green"))

p1 <- cutree(t, k=3)

dev.off()

#########################################

# Poiskati želim najboljše igralce v klubu po vseh statističnih spremenljivkah.

CHI$TOI.GP <- NULL
normaliziran <- scale(as.matrix(CHI[c(6:18)]))
matrikarazdalj <- dist(normaliziran)
razdelitev <- hclust(matrikarazdalj, method = "complete")

pdf("slike/najigralci.pdf")
plot(razdelitev, hang=-1, cex=0.6, main = "Uspešnost igralcev ekipe Chicago Blackhawks")
rect.hclust(razdelitev,k = 4,border="orange")
dev.off()

p <- cutree(razdelitev, k=4)
barve=c("red", "green", "blue","cyan")
table(p)
barve

pdf("slike/najigralci1.pdf")
pairs(normaliziran, col = barve[p])
dev.off()

# Graf prikazuje položaje osamelcev v odvisnosti od ostalih igralcev.

###############################################################################

# Metoda enojnega povezovanja

razdelitev1 <- hclust(matrikarazdalj, method = "single")

pdf("slike/chicago.pdf")
plot(razdelitev1, hang=-1, cex=0.6, main = "Uspešnost igralcev z metodo enojnega povezovanja")
rect.hclust(razdelitev1,k=4,border="red")
dev.off()
