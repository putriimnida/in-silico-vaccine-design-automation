process RunRScript {
    script:
    """
    Rscript src/script.R
    """
}

process RunPythonScript {
    script:
    """
    python src/script.py
    """
}
