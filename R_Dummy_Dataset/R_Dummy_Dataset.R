# ==============SETTING WORK===========================================

# Setting the working directory
setwd("C:/Users/UGHE Staff/Desktop/My_R_Projects/R_Dummy_Dataset")
working_directory <- setwd("C:/Users/UGHE Staff/Desktop/My_R_Projects/R_Dummy_Dataset")

# =========================SAVING WORK ========================================================

# Save the work space
save.image("R_Dummy_Dataset.RData")

# Save history
savehistory("R_Dummy_Dataset.Rhistory")

# ======================= STARTING WORK ========================================================

# Step 1: Creating an empty data frame with specified columns
dummy_data <- data.frame(
  "S/N" = integer(23),  # Sequence number for 23 students
  "Names" = character(23),  # Placeholder for student names
  "Sex" = character(23),  # Placeholder for sex
  "Nationality" = character(23)  # Placeholder for nationality
)

# View the data frame
dummy_data

# Step 2: Populating the S/N and Names columns 
dummy_data$"S/N" <- 1:23	# Sequence from 1 to 23
dummy_data$Names <- paste("Student", 1:23)	# Creating names Student 1 to Student 23

# Step 3: Assigning sex to the names

# Setting the seed for reproducibility
set.seed(123)

# Randomly assigning 7 males and 16 females
dummy_data$Sex <- sample(c(rep("Male", 7), rep("Female", 16)))

# Step 4: Assigning Nationalities

# Nationality distribution
nationality_distribution <- c(rep("Nationality 1", 13), rep("Nationality 2", 2), rep("Nationality 3", 2), rep("Nationality 4", 2), rep("Nationality 5", 1), rep("Nationality 6", 1), rep("Nationality 7", 1), rep("Nationality 8", 1))

# Randomly assigning nationalities while maintaining the distribution
dummy_data$Nationality <- sample(nationality_distribution)

# Step 5: Reviewing the Dataset

# Viewing the first few rows of the dummy dataset 
head(dummy_data)

# Step 6: Removing The Mistakenly Added “S.N” Column

# Checking if the "S.N" column exists in the dataset
if ("S.N" %in% colnames(dummy_data)) {
  # If it exists, remove it
  dummy_data$'S.N' <- NULL
}

# Step 7: Ensuring The “S/N” Column is the First Column
# Reordering columns to ensure "S/N" is the first column 
dummy_data <- dummy_data[, c("S/N", "Names", "Sex", "Nationality")]

# Step 8: Exporting Data

# Step 8.1. Exporting the dataset to a CSV file
write.csv(dummy_data, "dummy_dataset.csv", row.names = FALSE)

# Step 8.2. Exporting the dataset to an Excel file

# Installing openxlsx package (if it's not already installed)
if (!requireNamespace("openxlsx", quietly = TRUE)) { install.packages("openxlsx")
}

# Loading the openxlsx package
library(openxlsx)

# Exporting the dataset 
write.xlsx(dummy_data, file = "dummy_dataset.xlsx", rowNames = FALSE)

# THE OUTCOME 

# Viewing the whole dataset
View(dummy_data)

# ====================== EXITING WORK ========================================================

# Clear work space
rm(list = ls())