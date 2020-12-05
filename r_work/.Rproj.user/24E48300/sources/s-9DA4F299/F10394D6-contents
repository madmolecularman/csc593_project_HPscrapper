require(rentrez)
require(XML)
require(ape)
require(phangorn)
#source('utils.R')
entrez_email <- "gree9242@uri.edu"
entrez_dbs()
entrez_db_summary('assembly')
entrez_db_searchable('assembly')
entrez_db_links('assembly')
entrez_search(db='assembly', term = 'Human gammaherpesvirus 4')
search_fields <- entrez_db_searchable('nuccore')
tax <- entrez_search(db="genome",term="gammaherpesvirus", retmax=10)
tax
tax$ids
genome <- entrez_search(db="genome",term=paste("txid",tax$ids,"[Orgn]",sep=""))
genome
genome$ids
