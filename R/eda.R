# ------ FPAS distributions ------
# Exposure distribution assessment
library("tidyverse")
library("ggplot2")
library("haven")
library("tidyverse")

# Load dataset into workspace
pfas = read_xpt("data/P_PFAS.xpt")     # Perfluoroalkyl & polyfluoroalkyl substances


pfas_long = pfas %>%
  select(-SEQN) %>%
  pivot_longer(
    cols = everything(),
    names_to = "PFAS",
    values_to = "concentration"
  ) %>%
  filter(!is.na(concentration), concentration > 0)

ggplot(pfas_long, aes(x = concentration)) +
  geom_histogram(bins = 40) +
  scale_x_log10() +
  facet_wrap(~ PFAS, scales = "free") +
  labs(
    title = "Distribution of PFAS Concentrations",
    x = "PFAS concentration (log scale)",
    y = "Count"
  ) +
  theme_bw()

# Anything with "-Comment Code" is categorical (possibly binary)

# Correlation structure of PFAS biomarkers


cor(pfas[,-1], use = "pairwise.complete.obs") %>% heatmap()
