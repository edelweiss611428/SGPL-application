# ------ FPAS distributions ------
# Exposure distribution assessment
library("tidyverse")
library("ggplot2")
library("haven")
library("tidyverse")

# Load dataset into workspace
pfas = read_xpt("data/P_PFAS.xpt")     # Perfluoroalkyl & polyfluoroalkyl substances


# Categorical PFAS variables
pfas_cat_vars = c(
  "LBDBFOAL",
  "LBDMFOSL",
  "LBDMPAHL",
  "LBDNFOAL",
  "LBDNFOSL",
  "LBDPFDEL",
  "LBDPFHSL",
  "LBDPFNAL",
  "LBDPFUAL"
)


## ------ PFAS concentration distributions ------

pfas_long = pfas %>%
  select(
    -SEQN,
    -all_of(pfas_cat_vars)
  ) %>%
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


## ------ Categorical PFAS distributions ------

pfas_cat_long = pfas %>%
  select(all_of(pfas_cat_vars)) %>%
  pivot_longer(
    cols = everything(),
    names_to = "PFAS",
    values_to = "category"
  ) %>%
  filter(!is.na(category))

ggplot(pfas_cat_long, aes(x = factor(category))) +
  geom_bar() +
  facet_wrap(~ PFAS, scales = "free") +
  labs(
    title = "Distribution of Categorical PFAS Variables",
    x = "Category",
    y = "Count"
  ) +
  theme_bw()

# ------ Correlation structure of PFAS biomarkers ------


cor(pfas[,-1], use = "pairwise.complete.obs") %>% heatmap()
