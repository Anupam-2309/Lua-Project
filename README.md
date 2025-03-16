# LuaTeX Statistical Package Development

## Overview
This repository contains the development work on LaTeX statistical packages **luatests** and **luastats**, designed to perform statistical computations directly within LaTeX documents using LuaLaTeX. 

These packages were developed under the guidance of **Dr. Chetan Shirore** and **Dr. Ajit Kumar** to bridge the gap between LaTeX's typesetting capabilities and statistical analysis.

---
### **Luastats Package**
- Provides essential statistical functions:
  - **Mean, Median, Mode**
  - **Variance and Standard Deviation**
  - **Quartiles and Interquartile Range (IQR)**
  - **Skewness and Kurtosis**
  - **Correlation and Regression Analysis**
  - **Probability Mass Functions (PMFs), PDFs, and CDFs**
- Supports **CSV data analysis**.
- Includes **probability distribution functions** and **random number generation**.


## Features
### **Luatests Package**
- Provides functions for performing statistical tests:
  - **Welch’s T-Test**
  - **Independent T-Test**
  - **Paired T-Test**
  - **One-Sample T-Test**
  - **One-Way ANOVA**
  - **Two-Way ANOVA**
- Outputs formatted LaTeX tables with statistical results.
- Requires **LuaLaTeX** for compilation.



---

## Installation
1. Place the package `.sty` files in your LaTeX directory.
2. Include the package in your LaTeX document:
   ```latex
   \usepackage{luatests}  % For statistical tests
   \usepackage{luastats}  % For statistical functions
   ```
3. Compile using **LuaLaTeX**.

---

## Usage Examples
### Using `luatests`
```latex
\luaWelchsTTest[label=Welch’s T-Test]{1, 2, 3, 4}{5, 6, 7, 8}
```

### Using `luastats`
```latex
\luaMean{1,2,3,4,5} % Computes Mean
```

---

## Contributors
- **Anupam Maurya**
- **Chetan Shirore**
- **Ajit Kumar**


---

## License
Both packages are released under the **LaTeX Project Public License v1.3c or later**.
More details: [LaTeX Project License](http://www.latex-project.org/lppl.txt).

---

## Acknowledgments
This work was carried out under the guidance and mentorship of **Dr. Chetan Shirore** and **Dr. Ajit Kumar**, whose insights and expertise were invaluable in the development of these LaTeX packages.

