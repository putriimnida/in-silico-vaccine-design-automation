# Load required libraries
library(rentrez)
library(Biostrings)

# Function to retrieve and save a sequence from NCBI given an accession number
retrieve_and_save_sequence <- function(accession_number) {
  cat("Starting retrieval for accession number:", accession_number, "\n")
  
  # Fetch the sequence data from NCBI
  # Make sure to adjust the db parameter according to the type of sequence
  sequence_data <- entrez_fetch(db = "protein",   # Changed to 'protein' if the accession number is for a protein
                                id = accession_number, 
                                rettype = "fasta", 
                                retmode = "text")
  
  if (nchar(sequence_data) == 0) {
    stop("No data retrieved. Check the accession number and internet connection.")
  }
  
  # Define the output FASTA file name
  fasta_file_name <- paste0(accession_number, "_sequence.fasta")
  
  # Save the sequence data to a FASTA file
  writeLines(sequence_data, fasta_file_name)
  cat("Sequence data has been saved to:", fasta_file_name, "\n")
  
  return(fasta_file_name)
}

# Main function to automate the sequence retrieval and save process
automate_sequence_retrieval <- function(accession_number) {
  cat("Automated sequence retrieval initiated for accession number:", accession_number, "\n")
  
  # Retrieve and save the sequence
  fasta_file <- retrieve_and_save_sequence(accession_number)
  
  cat("Automated sequence retrieval and saving completed.\n")
  return(fasta_file)
}

# Example usage with the specific accession number for Hemagglutinin
automate_sequence_retrieval("BAL61222.1")
