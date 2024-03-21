
library(vcfR)
library(dplyr)
library(VariantAnnotation)


# Function to load and prepare VCF file for MOBSTER pipeline
load_and_prepare_vcf <- function(file_path) {
  vcf <- read.vcfR(file_path)
  vcf_df <- as.data.frame(vcf@fix)

  # Assuming the VAF calculation is part of the process, we skip it
  # and directly prepare the data frame for MOBSTER without any specific VAF calculation

  # Select relevant columns - this is a placeholder and should be adjusted based on actual requirements
  relevant_columns <- c("CHROM", "POS", "ID", "REF", "ALT", "QUAL", "FILTER", "INFO")
  vcf_df <- vcf_df %>% select(all_of(relevant_columns))

  # Further processing can be added here based on MOBSTER's specific input requirements

  return(vcf_df)
}

# Path to the new VCF file
vcf_file_path <- "../vignettes/C57-1_MPX3.vcf"

# Load and prepare the VCF file
x3_vcf <- load_and_prepare_vcf(vcf_file_path)

# Display the first few rows of the final data frame to verify
head(x3_vcf)


