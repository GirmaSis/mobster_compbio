
library(mobster)
library(tidyr)
library(dplyr)
library(ggplot2)
library(reshape2)


library(VariantAnnotation)

# "../vignettes/C57-1_MPX3.vcf"



# Function to read and process a VCF file, adding a STATUS column for cancer type
process_vcf <- function(vcf_file_path, sample_status) {
  vcf <- readVcf(vcf_file_path)  
  
  # Accessing seqnames, positions, ref, and alt alleles directly
  chrom <- as.character(seqnames(vcf))
  pos <- start(ranges(vcf))
  ref <- as.character(ref(vcf))
  alt <- as.character(alt(vcf))
  qual <- qual(vcf)
  
  # Extracting filter information. Adjusting approach based on the available methods
  filterInfo <- lapply(seq_along(vcf), function(i) {
    if(length(metadata(vcf)[[i]]$filter) == 0) "PASS" else paste(metadata(vcf)[[i]]$filter, collapse = ";")
  })
  
  # Extracting DP and AF from INFO fields
  dp <- info(vcf)$DP
  af <- info(vcf)$AF
  
  # Creating a dataframe with the extracted information and a STATUS column
  df <- data.frame(STATUS = sample_status, CHROM = chrom, POS = pos, REF = ref, 
                   ALT = alt, QUAL = qual, FILTER = unlist(filterInfo), DP = dp, AF = af, stringsAsFactors = FALSE)
  
  return(df)
}

# Specify the paths to your VCF files
normal_vcf_path <- "../vignettes/C57-1_MPX3.vcf"
tumor_vcf_path <- "../vignettes/D_2-1_MPX4.vcf"

# Process each file with its corresponding status
normal_df <- process_vcf(normal_vcf_path, "NORMAL")
tumor_df <- process_vcf(tumor_vcf_path, "TUMOR")

# Merge the two dataframes
merged_df <- rbind(normal_df, tumor_df)

# Print the first few rows of the merged dataframe
print(head(merged_df))



print("Done!")








