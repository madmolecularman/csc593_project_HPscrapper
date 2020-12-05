require(rentrez)

# Accessing and assessing Entrez databases

entrez_dbs()
entrez_db_summary("taxonomy")
entrez_db_searchable("taxonomy")
entrez_db_links("taxonomy")
entrez_db_summary("pubmed")
entrez_db_searchable("pubmed")
entrez_db_links("pubmed")

#search organism as a search term and return the full taxonomy

taxonomy_search <- entrez_search(db="taxonomy", term = "Mus musculus", rettype = "rank")
taxonomy_search
#search Pubmed for articles on warfarin

search_results <- entrez_search(db="pubmed", term="warfarin")
search_results
search_results$ids

#search sequence read archive for E. coli submissions between 2018 and 2019

search_results2 <- entrez_search(db = "sra",
                                 term = "Escherichia coli[ORGN] AND 2018:2019[PDAT]",
                                 retmax = 10)
search_results2$QueryTranslation

# search Pubmed for articles on insulin

search_results3 <- entrez_search(db = "pubmed",
                                 term = "insulin AND diabetes[MeSH]",
                                 retmax = 10)
search_results3$QueryTranslation

# plot number of publications by year for the term "Interactome"

search_year <- function(year, term) {
  query <- paste(term, "AND (", year, "[PDAT])")
  search <- entrez_search(db="pubmed", term=query, retmax=10)
  prints <- return(search$ids)
  prints
}

year <- 2015:2019
papers <- sapply(year, search_year, term="insulin AND diabetes", USE.NAMES = FALSE)
papers
plot(year, papers, type="b")

# find all links in Entrez databases to the gene encoding the human amyloid beta precursor protein

all_the_links <- entrez_link(dbfrom="gene", id=351, db="all")
all_the_links
all_the_links$links
all_the_links$links$gene_pmc[1:10]
all_the_links$links$gene_clinvar

# Find all links in the nucleotide database to the human APP and APRT genes

nuc_links <- entrez_link(dbfrom="gene", id=c(351,353), db="nuccore", by_id = TRUE)
nuc_links
lapply(nuc_links, function(x) x$links$gene_nuccore)

# search Pubmed for links to the manuscripts returned from the warfarin search

search_results
taxize_sum <- entrez_summary(db="pubmed", id = search_results$ids)
taxize_sum
extract_from_esummary(taxize_sum, c("fulljournalname", "pubdate", "title"))

# extract nucleotide sequence in fasta format for the human insulin gene

nuc <- entrez_fetch(db="nuccore", id = "L15440", rettype = "fasta")
nuc
