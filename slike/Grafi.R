pdf("slike/grafi.pdf", paper="a4")
barplot(ekipe[1:6, 2], names.arg = c(ekipe[1:6,1]), col = rainbow(30), xlab = "Team", ylab = "Wins")
dev.off()