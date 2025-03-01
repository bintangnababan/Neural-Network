### Project Description

This project demonstrates a **classification pipeline** using **XGBoost** with **hyperparameter tuning** via grid search, applied to a **multiclass classification problem**. The approach is designed for datasets where the goal is to predict the type or category of a sample based on numerical features — such as the **Glass Identification Dataset** where the chemical composition of glass is used to classify its type (e.g., building windows, vehicle windows, containers, etc.).

### Objective

The primary goal of this project is to:

- **Build a robust multiclass classification model** using XGBoost.
- **Perform systematic hyperparameter tuning** using the `caret` package's grid search functionality.
- **Evaluate the model’s performance using cross-validation and test data.**
- **Visualize the tuning process and final model performance.**

### Key Steps

1. **Data Preparation**  
   The dataset is split into **training and testing sets** to assess model generalization. Feature scaling (centering and scaling) is applied for optimal model performance.
   
2. **Hyperparameter Tuning**  
   A **grid search** over multiple hyperparameters is performed, including:
   - Number of boosting rounds (`nrounds`)
   - Learning rate (`eta`)
   - Maximum tree depth (`max_depth`)
   - Minimum child weight (`min_child_weight`)
   - Subsampling rate (`subsample`)
   - Column sampling rate (`colsample_bytree`)
   - Regularization (`gamma`)

3. **Model Training & Validation**  
   The model is trained using **5-fold cross-validation** with `caret::train()`, optimizing for **Accuracy** as the evaluation metric. The process also logs intermediate results to track progress.

4. **Model Evaluation**  
   The tuned model is tested on the **holdout test set**, and **confusion matrix** analysis is performed to assess performance on unseen data. Overall test **accuracy** is also reported.

5. **Visualization**  
   A **tuning plot** is generated to illustrate the relationship between hyperparameters and model performance. This helps in understanding the impact of tuning choices.

### Use Case Context (Glass Identification Dataset)

Although this example uses the `iris` dataset for demonstration, the same approach can be directly applied to datasets such as the **Glass Identification Dataset**, where the goal is to classify glass samples based on their chemical composition. The flexibility of this pipeline makes it suitable for any numeric-feature-based multiclass classification problem.

### Packages Used

- `caret` – Model training, hyperparameter tuning, cross-validation
- `xgboost` – Core XGBoost algorithm
- `dplyr` – Data manipulation
- `ggplot2` – Visualization

### Key Output

- Best hyperparameter combination
- Confusion matrix on test data
- Test set accuracy
- Tuning process visualization (hyperparameter performance plot)

---
