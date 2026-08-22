library("haven")
library("tidyverse")

# Load datasets into workspace
ghb = read_xpt("data/P_GHB.xpt")       # Glycohemoglobin (HbA1c) levels
diq = read_xpt("data/P_DIQ.xpt")       # Diabetes questionnaire (self-reported)
pfas = read_xpt("data/P_PFAS.xpt")     # Perfluoroalkyl & polyfluoroalkyl substances

demo = read_xpt("data/P_DEMO.xpt")     # Demographic data (age, sex, race, etc.)
bmx = read_xpt("data/P_BMX.xpt")       # Body measures (height, weight, BMI)
bpxo = read_xpt("data/P_BPXO.xpt")     # Blood pressure readings (oscillometric)
inq = read_xpt("data/P_INQ.xpt")       # Family & individual income data
alq = read_xpt("data/P_ALQ.xpt")       # Alcohol use questionnaire

smq = read_xpt("data/P_SMQ.xpt")       # Cigarette & tobacco use questionnaire
smqfam = read_xpt("data/P_SMQFAM.xpt") # Household smokers / family smoking history
smqrtu = read_xpt("data/P_SMQRTU.xpt") # Recent tobacco use (past 5 days)
smqshs = read_xpt("data/P_SMQSHS.xpt") # Secondhand smoke exposure

# Merge all datasets via SEQN (key)

nhanes_data = demo %>%
  left_join(ghb, by = "SEQN") %>%
  left_join(diq, by = "SEQN") %>%
  left_join(pfas, by = "SEQN") %>%
  left_join(bmx, by = "SEQN") %>%
  left_join(bpxo, by = "SEQN") %>%
  left_join(inq, by = "SEQN") %>%
  left_join(alq, by = "SEQN") %>%
  left_join(smq, by = "SEQN") %>%
  left_join(smqfam, by = "SEQN") %>%
  left_join(smqrtu, by = "SEQN") %>%
  left_join(smqshs, by = "SEQN")


saveRDS(nhanes_data, "data/nhanes_2017_2020_merged.rds")
