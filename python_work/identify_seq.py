#!/usr/bin/env python3
# Import statements
# Import sys module for arguments
import sys
# Import Biopython module
import bio
# Improt Entrez package in Bio
from bio import Entrez
# Usage statement
if len(sys.argv)<3:
    print("")
    print("This script will take the taxonomic name (genus and species) of a host and pathogen, mine NCBI for their records, and save the full genbank record, ten assocaited publications, and a list of the relevant accession numbers to access genetic information")
    print("Usage: identify.py -ht <genus_species> -pt <genus_species> -outdir <output_directory_name>")
    print("-ht = host genus and species")
    print("-pt = pathogen genus and species")
    print("-outdir = output directory name/location")
    print("If there are any problems please contact gree9242@uri.edu")
    print("")
    sys.exit()
# For loop to define the arguments as variables
for i in range(len(sys.argv)):
    if sys.argv[i] == "-ht":
        host = sys.argv[i+1]
    elif sys.argv[i] == "-pt":
        path = sys.argv[i+1]
    elif sys.argv[i] == "-outdir":
        out = sys.argv[i+1]
		
print()
print('Your host organism we will be searching for is' + (host))
print()
print('Your pathogen organism we will be searching for is' + (path))
print()
print('The name of the outdirectory you would like to use is' + (out))

# Identify pathogen and host record within NCBI (identify.py)
# You will need to add your own api key from NCBI
# Always add an email so NCBI may contact you if there are problems
Entrez.api_key = "92471a1f25f1f658f6711d0c7bc31ff80708"
Entrez.email = "gree9242@uri.edu"
handle1 = Entrez.esearch(db='nucleotide',term=host,idtype="acc",retmax='20')
handle2 = Entrez.esearch(db='nucleotide',term=pathogen,idtype="acc",retmax='20')
record1 = Entrez.read(handle1)
record2 = Entrez.read(handle1)
print('{} number of host ids found'.format(record1["Count"]))
print()
print('{} host id list'.format(record1["IdList"]))
print()
print('{} pathogen ids found'.format(record2["Count"]))
print()
print('{} pathogen id list'.format(record2["IdList"]))