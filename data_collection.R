library("haven")
library("tidyverse")

# Create ./data directory if it does not exist
if (!dir.exists("./data")) {
  dir.create("./data", recursive = TRUE)
}

# ----------- OUTCOME VARIABLES -----------
# Glucohaemoglobin
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_GHB.xpt",
  "data/P_GHB.xpt",
  mode = "wb"
)

# Diabete (self-reported)

download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_DIQ.xpt",
  "data/P_DIQ.xpt",
  mode = "wb"
)

# ----------- FFAS -----------

download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_PFAS.xpt",
  "data/P_PFAS.xpt",
  mode = "wb"
)

# ----------- EFFECT MODIFIERS -----------

# Demographic
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_DEMO.xpt",
  "data/P_DEMO.xpt",
  mode = "wb"
)
# Body measurements
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_BMX.xpt",
  "data/P_BMX.xpt",
  mode = "wb"
)
# Blood pressures
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_BPXO.xpt",
  "data/P_BPXO.xpt",
  mode = "wb"
)
# Income
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_INQ.xpt",
  "data/P_INQ.xpt",
  mode = "wb"
)

# Alcohol intake
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_ALQ.xpt",
  "data/P_ALQ.xpt",
  mode = "wb"
)

# Smoking (cigarette)
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_SMQ.xpt",
  "data/P_SMQ.xpt",
  mode = "wb"
)

# Smoking (household smokers)
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_SMQFAM.xpt",
  "data/P_SMQFAM.xpt",
  mode = "wb"
)

# Smoking (recent tobacco uses)
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_SMQRTU.xpt",
  "data/P_SMQRTU.xpt",
  mode = "wb"
)

# Smoking (2nd hand exposure)
download.file(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/P_SMQSHS.xpt",
  "data/P_SMQSHS.xpt",
  mode = "wb"
)

