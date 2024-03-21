library(vcfR)

# Step 1: Load the VCF files

#vcf1 <- read.vcfR("../vignettes/C57-1_MPX3.vcf")
#vcf2 <- read.vcfR( "../vignettes/D_2-1_MPX4.vcf")

# Step 2: Convert to data frames (extracting fixed part, for example)
df1 <- vcf_xxx3
df2 <- vcf_xxx4

# Optionally, add an identifier column to each data frame
df1$Source <- "C57-1_MPX3"
df2$Source <- "D_2-1_MPX4"

# Step 3: Merge the data frames
combined_df <- rbind(df1, df2)

# Step 4 is preparing this combined data frame for Mobster, which would depend on Mobster's specific requirements.
