pdf("slike/grafi.pdf", paper="a4")
#graf 1
barplot(ekipe[1:30, 3], names.arg = c(ekipe[1:30,1]), col = "gray", las = 2, ylab = "Zmage", cex.names = 0.7,
        main = "Število zmag po klubih lige NHL", ylim = c(0, 55))

#graf 2
barplot(as.matrix(ekipe[1:10,11]), beside=TRUE,legend.text = ekipe[1:10, 1], col = rainbow(15), las = 1, 
        xlim=c(0,20),ylab="Povprečno število golov na tekmo",
        main = "Povprečno število doseženih golov na tekmo - NHL klubi")
#graf 3
barplot(igralci$G[1:15], main = "Število zadetkov igralcev Chicaga (2013/14)", names.arg = igralci$Player[1:15],
        cex.names = 0.75, las = 2, col = rainbow(20), ylim = c(0, 35))


dev.off()