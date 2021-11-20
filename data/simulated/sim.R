reads <- t(readRDS("readsToSpike.rds"))

df <- reshape2::melt(reads)

df$Var2 <- gsub(pattern = "GATTGAAACCATCCTCTGCTTCCA", replacement = "TATGATTGCTCCTCCA", x = df$Var2)


df_sp <- split(df, df[, 1])


dna <- lapply(df_sp, function(x) {
  seq <- NULL
  for (i in 1:nrow(x)) {
    seq <- c(seq, rep(as.character(x[i, 2]), x[i, 3]))
  }
  Biostrings::DNAStringSet(seq)
})

tmp <- lapply(names(dna), function(i) {
  s <- dna[[i]]
  names(s) <- paste0(i, "_seq", seq_along(s))
  Biostrings::writeXStringSet(
    x = s,
    filepath = paste0(i, ".fa"),
    format = "fasta"
  )
})
