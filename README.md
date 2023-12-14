# Neural Network
```R
# Glass Dataset Neural Network Modeling

## 1. Load and Import Data

```R
# Load necessary libraries
library(readr)
library(data.table)

# Read the Glass dataset
Glass <- read_csv("C:/Users/Binta/Downloads/glass.csv")
head(Glass)

# Convert data to data.table
data.glass <- data.table(Glass)
data.glass
```
The code loads required R libraries, such as `readr` and `data.table`. The Glass dataset is read using `read_csv` and then converted to a data.table for further processing.

## 2. Data Cleaning

```R
# Remove Missing Values
new.glass <- na.omit(data.glass, col = c("RI", "Na", "Mg", "Al", "Si", "K", "Ca", "Ba", "Fe"))

# Remove Duplicate Data
new.glass <- unique(new.glass)
new.glass
```
- Missing values are removed using `na.omit` function.
- Duplicate records are removed to ensure data integrity.

## 3. Exploratory Data Analysis (EDA)

```R
# Scatterplot Matrix
pairs(new.glass)

# Summary Statistics
summary(new.glass)

# Correlation Matrix and Heatmap
cor_matrix <- cor(new.glass)
heatmap(cor_matrix)
```

- The code generates a scatterplot matrix, summary statistics, and a correlation matrix heatmap for exploratory data analysis.

## 4. Feature Engineering

```R
# Normalize Numeric Variables
library(caret)
preProcess_data <- preProcess(new.glass[, c("RI", "Na", "Mg", "Al", "Si", "K", "Ca", "Ba", "Fe")], method = c("center", "scale"))
new.glass <- predict(preProcess_data, newdata = new.glass)
```

- Numeric variables are normalized using the `preProcess` function from the `caret` library.

## 5. Data Splitting

```R
# Type
glass.type <- new.glass$Type
table(glass.type)

# Split Data into Training and Testing Sets
set.seed(123)
train_index <- sample(1:nrow(new.glass), 0.8 * nrow(new.glass))
train_data <- new.glass[train_index,]
test_data <- new.glass[-train_index]
```

- The Type variable is extracted for classification.
- Data is split into training and testing sets for model evaluation.

## 6. Neural Network Modeling

```R
# Determine the Number of Hidden Layers and Neurons
nx = 9
ny = 6
nz = sqrt(nx * ny)
nz

# Build Neural Network
library(neuralnet)
nn <- neuralnet(Type ~ RI + Na + Mg + Al + Si + K + Ca + Ba + Fe, data = train_data, hidden = nz, linear.output = FALSE)
```

- The number of neurons in the hidden layer is determined.
- A neural network model is built using the `neuralnet` library.

## 7. Plotting and Analysis

```R
# Plot Neural Network
plot(nn)

# Display Weights
weights(nn)
```

- The neural network structure is visualized, and the weights are displayed for analysis.
