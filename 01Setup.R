dir.create("data", showWarnings = FALSE)
download.file(
  url = "https://raw.githubusercontent.com/Bioconductor/bioconductor-teaching/master/data/TrimmomaticAdapters/TruSeq3-PE-2.fa", 
  destfile = "data/TruSeq3-PE-2.fa"
)
download.file(
  url = "https://raw.githubusercontent.com/Bioconductor/bioconductor-teaching/master/data/ActbGtf/actb.gtf", 
  destfile = "data/actb.gtf"
)
download.file(
  url = "https://raw.githubusercontent.com/Bioconductor/bioconductor-teaching/master/data/ActbOrf/actb_orfs.fasta", 
  destfile = "data/actb_orfs.fasta"
)
download.file(
  url = "https://raw.githubusercontent.com/Bioconductor/bioconductor-teaching/master/data/ActbFastq/actb.fastq", 
  destfile = "data/actb.fastq"
)

DNAString("ATCG")

dna1 <- DNAString("ATCGCTTTGA")
matchPattern("GM", dna1, fixed = TRUE)
matchPattern("GM", dna1, fixed = FALSE)

truseq_adapters <- readDNAStringSet(filepath = "data/TruSeq3-PE-2.fa")
truseq_adapters

letterFrequency(truseq_adapters, letters = DNA_ALPHABET)
AA_ALPHABET
AA_PROTEINOGENIC

AA <- AA_STANDARD
AAP <- AA_PROTEINOGENIC
AAP[!AAP %in% AA ]
#
setdiff(AA_PROTEINOGENIC, AA_STANDARD)

showMethods("translate")

actb_orf_nih <- readDNAStringSet("data/actb_orfs.fasta")
actb_orf_nih
actb_aa <- translate(actb_orf_nih)
actb_aa
width(actb_aa)
max(width(actb_aa))

library(BSgenome)
available.genomes()
BiocManager::install("BSgenome.Hsapiens.UCSC.hg38.masked")
library(BSgenome.Hsapiens.UCSC.hg38.masked)

BSgenome.Hsapiens.UCSC.hg38.masked

genome <- BSgenome.Hsapiens.UCSC.hg38.masked
seqnames(genome)
chrY <- genome[["chrY"]]
countPattern(pattern = "CANNTG", subject = chrY, fixed = FALSE)