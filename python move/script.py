from Bio import SeqIO
from iedb import query_mhci_binding

# Load the sequence from the FASTA file
record = SeqIO.read("./BAL61222.1_sequence.fasta", "fasta")


# Function to predict epitopes using IEDB MHC I binding prediction
def predict_epitopes(sequence):
    results = query_mhci_binding(
        method="recommended",
        sequence=str(sequence.seq),
        allele="HLA-A*02:01",
        length=9
    )
    return results

# Run the prediction
epitopes = predict_epitopes(record)
print("Predicted Epitopes:", epitopes)
