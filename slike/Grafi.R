pdf("slike/grafi.pdf", paper="a4")

#graf 1
barplot(ekipe[, 2], names.arg = rownames(ekipe), col = "skyblue2", las = 2, ylab = "Zmage", cex.names = 0.7, 
        main = "Število zmag po klubih lige NHL - 2013/14", ylim = c(0, 60))

#graf 2
barplot(ekipe[1:10,13], names.arg = rownames(ekipe)[1:10], col = rainbow(55), las = 2, xlim=c(0,13),
        ylab="Power-play percentage", main = "Odtstotek izkoriščenih Power-play priložnosti", cex.names = 0.8, ylim = c(0, 25))

#graf 3
barplot(ekipe[,11], names.arg = rownames(ekipe), col = "blue", las = 2, xlim=c(0,33), ylab="Povprečno število golov na tekmo", 
        main = "Povprečno število doseženih golov na tekmo - NHL klubi", cex.names = 0.5, ylim = c(0, 3.5))

#graf 4
priimki <- gsub("^.* ", "", rownames(igralci))
barplot(igralci$G, main = "Število zadetkov igralcev Chicaga (2013/14)", names.arg = priimki,
        cex.names = 0.75, las = 2, col = "deepskyblue", ylim = c(0, 35))


dev.off()