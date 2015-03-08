pdf("slike/grafi.pdf", paper="a4")

#graf 1
ekipe1 <- ekipe[order(ekipe$W, decreasing=TRUE),]
barplot(ekipe1[, 2], names.arg = rownames(ekipe1), col = "skyblue2", las = 2, ylab = "Zmage", cex.names = 0.7, 
        main = "Število zmag po klubih lige NHL - 2013/14", ylim = c(0, 60))

#graf 2
ekipe2 <- ekipe[order(ekipe$PPperc, decreasing=TRUE),]
barplot(ekipe2[1:10,13], names.arg = rownames(ekipe2)[1:10], col = rainbow(55), las = 2, xlim=c(0,13),
        ylab="Power-play percentage", 
        main = "Odtstotek izkoriščenih Power-play priložnosti", 
        cex.names = 0.6, ylim = c(0, 25))

#graf 3
ekipe3 <- ekipe[order(ekipe$GGP, decreasing=TRUE),]
barplot(ekipe3[,10], names.arg = rownames(ekipe3), col = "blue", las = 2, xlim=c(0,33), ylab="Povprečno število golov na tekmo", 
        main = "Povprečno število doseženih golov na tekmo - NHL klubi", 
        cex.names = 0.5, ylim = c(0, 3.5))

#graf 4
igralci <- igralci[order(igralci$G, decreasing=TRUE),]
barplot(igralci$G, main = "Število zadetkov igralcev Chicaga (2013/14)", 
        names.arg = priimki,
        cex.names = 0.75, las = 2, col = "deepskyblue", ylim = c(0, 35))


dev.off()