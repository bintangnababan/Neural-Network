## Glass Identification Dataset

This dataset contains chemical composition data of various types of glass. The goal is to classify the glass type based on its composition. This dataset is widely used for machine learning classification tasks, particularly in forensic applications where glass fragments need to be identified and matched to potential sources.

### Dataset Overview

- **Number of Samples:** 214 glass samples
- **Number of Features:** 9 chemical attributes + 1 target label (glass type)

### Columns Description

| Column | Name | Description |
|---|---|---|
| 1 | RI | Refractive Index – measures how much light bends as it passes through the glass. |
| 2 | Na | Sodium – weight percent of sodium oxide in the glass. |
| 3 | Mg | Magnesium – weight percent of magnesium oxide in the glass. |
| 4 | Al | Aluminum – weight percent of aluminum oxide in the glass. |
| 5 | Si | Silicon – weight percent of silicon oxide in the glass. |
| 6 | K | Potassium – weight percent of potassium oxide in the glass. |
| 7 | Ca | Calcium – weight percent of calcium oxide in the glass. |
| 8 | Ba | Barium – weight percent of barium oxide in the glass. |
| 9 | Fe | Iron – weight percent of iron oxide in the glass. |
| 10 | Type | Target class – type of glass (see categories below). |

### Glass Type (Target Classes)

The `Type` column represents the class label indicating the intended use of the glass:

| Type | Description |
|---|---|
| 1 | Building windows (float processed) |
| 2 | Building windows (non-float processed) |
| 3 | Vehicle windows (float processed) |
| 4 | Vehicle windows (non-float processed) – no samples available in this dataset |
| 5 | Containers (e.g., bottles, jars) |
| 6 | Tableware (e.g., glass plates, drinking glasses) |
| 7 | Headlamps (vehicle headlights) |

### Notes

- **Source:** Originally sourced from the [UCI Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/glass+identification).
- **Use Cases:** This dataset is commonly used to practice classification algorithms such as **K-Nearest Neighbors (KNN)**, **Decision Trees**, **Random Forests**, and **Neural Networks**.
- **Forensic Application:** In forensic investigations, glass fragments found at crime scenes can be analyzed and compared to known glass types to determine their possible origin, such as from building windows, vehicle windows, or household glass items.

---

Let me know if you want me to generate a sample **README.md** file for your GitHub repo! 🚀
