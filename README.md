# SGPL-application

This repository contains the application project for **SGPL**.

## Getting Started

Clone the repository to your local environment:

```bash
git clone https://github.com/edelweiss611428/SGPL-application.git
cd SGPL-application
```

The analysis pipeline consists of the following R scripts.

### 1. Data collection

`data_collection.R`

Downloads the required NHANES datasets.

Run this script if the required raw data have not already been downloaded:

```r
source("data_collection.R")
```

### 2. Data merging

`data_merging.R`

Merges the required NHANES datasets into a single data frame called `nhanes_data`.

The current merged dataset has approximately:

* **15,560 observations**
* **174 variables**

Metadata are retained where available.

Run:

```r
source("data_merging.R")
```

> **Note:** Data transformations will be added/updated in this step as the analysis develops.

### 3. Data quality assessment

`data_quality_assessment.R`

Performs basic data quality assessment of `nhanes_data`, including summary information for the variables.

Run:

```r
source("data_quality_assessment.R")
```

### 4. Exploratory data analysis

`eda.R`

Contains exploratory data analyses (EDA) for the merged NHANES dataset, including visualisations and investigation of variable distributions and relationships.

Run:

```r
source("eda.R")
```

## Recommended Workflow

Run the scripts in the following order:

```text
data_collection.R
        ↓
data_merging.R
        ↓
data_quality_assessment.R
        ↓
eda.R
```

If the raw data have already been downloaded, `data_collection.R` can be skipped.


## Data

The project uses data from the **National Health and Nutrition Examination Survey (NHANES)**.

Raw data should be obtained using `data_collection.R` rather than manually committed to the repository where possible.

## Requirements

The analysis is implemented in **R**. Required R packages are loaded within the relevant scripts.

Install any missing packages before running the pipeline.

## Notes

The merged `nhanes_data` object is the main dataset used throughout the subsequent quality assessment and exploratory analyses. Changes to variable transformations or data preprocessing should be documented in `data_merging.R` and reflected in this README when appropriate.
