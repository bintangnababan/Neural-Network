# Load Libraries
library(readr)
library(data.table)
library(caret)
library(xgboost)
library(smotefamily)

# Import Data
glass <- read_csv("C:/Users/Binta/Downloads/glass.csv")

# Convert to data.table
data.glass <- data.table(glass)

# Data Cleaning
data.glass <- na.omit(data.glass)
data.glass <- unique(data.glass)
data.glass$Type <- as.factor(data.glass$Type)

# Normalization
numerical_cols <- c("RI", "Na", "Mg", "Al", "Si", "K", "Ca", "Ba", "Fe")
preProcess_data <- preProcess(data.glass[, ..numerical_cols], method = c("center", "scale"))
data.glass[, (numerical_cols) := predict(preProcess_data, newdata = data.glass)[, numerical_cols, with = FALSE]]

# Train-Test Split
set.seed(123)
train_index <- sample(1:nrow(data.glass), 0.8 * nrow(data.glass))
train_data <- as.data.frame(data.glass[train_index])
test_data <- as.data.frame(data.glass[-train_index])

# Separate Features and Labels
features <- train_data[, setdiff(names(train_data), "Type")]
labels <- train_data$Type

# Apply SMOTE
smote_result <- SMOTE(features, labels, K = 5, dup_size = 2)

# Recombine SMOTE result into data frame
train_data_balanced <- data.frame(smote_result$data)

# Rename target column
colnames(train_data_balanced)[ncol(train_data_balanced)] <- "Type"

# Convert Type to factor
train_data_balanced$Type <- as.factor(train_data_balanced$Type)

# Check Class Distribution
print(table(train_data_balanced$Type))

# Separate Features (X) and Labels (y) from SMOTE data
X_train <- as.matrix(train_data_balanced[, setdiff(names(train_data_balanced), "Type")])
y_train <- as.numeric(train_data_balanced$Type) - 1

# Prepare Test Data
X_test <- as.matrix(test_data[, setdiff(names(test_data), "Type")])
y_test <- as.numeric(test_data$Type) - 1

# XGBoost DMatrix
dtrain <- xgb.DMatrix(data = X_train, label = y_train)
dtest <- xgb.DMatrix(data = X_test, label = y_test)

# Number of Classes
num_class <- length(unique(y_train))

# XGBoost Parameters
params <- list(
  objective = "multi:softmax",
  eval_metric = "mlogloss",
  num_class = num_class
)

# Train XGBoost Model
xgb_model <- xgb.train(
  params = params,
  data = dtrain,
  nrounds = 100,
  watchlist = list(train = dtrain, test = dtest),
  print_every_n = 10,
  early_stopping_rounds = 10
)

# Predict
y_pred <- predict(xgb_model, newdata = dtest)

# Convert Predictions Back to Original Labels (1-7)
y_pred <- y_pred + 1
y_test <- y_test + 1

# Confusion Matrix
conf_matrix <- table(Predicted = y_pred, Actual = y_test)
print(conf_matrix)

# Overall Accuracy
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
cat("\nOverall Accuracy:", round(accuracy * 100, 2), "%\n")
