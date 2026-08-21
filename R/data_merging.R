# Load datasets into workspace

ghb = read_xpt("data/P_GHB.xpt")
diq = read_xpt("data/P_DIQ.xpt")
pfas = read_xpt("data/P_PFAS.xpt")

demo = read_xpt("data/P_DEMO.xpt")
bmx = read_xpt("data/P_BMX.xpt")
bpxo = read_xpt("data/P_BPXO.xpt")
inq = read_xpt("data/P_INQ.xpt")
alq = read_xpt("data/P_ALQ.xpt")

smq = read_xpt("data/P_SMQ.xpt")
smqfam = read_xpt("data/P_SMQFAM.xpt")
smqrtu = read_xpt("data/P_SMQRTU.xpt")
smqshs = read_xpt("data/P_SMQSHS.xpt")

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
