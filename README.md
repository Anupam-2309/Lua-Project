# LuaStats: Statistical Computing Package for LaTeX

## Overview
**LuaStats** is a comprehensive statistical computing package developed in Lua for LaTeX, designed to facilitate advanced statistical calculations and analyses directly within LaTeX documents. This project was developed as part of MSc Statistics research to bridge the gap between statistical computing and document preparation.

## 🎯 Project Goals
- Provide a robust statistical computing environment within LaTeX
- Simplify complex statistical calculations for researchers
- Enable seamless integration of statistical analyses in academic papers
- Create reproducible research documents with embedded calculations

## 📊 Features

### 1. Basic Statistical Operations
- Descriptive Statistics (mean, median, variance, standard deviation)
- Probability Distributions
- Correlation and Covariance Matrices
- Hypothesis Testing

### 2. Advanced Statistical Methods
- ANOVA (One-way, Two-way)
- Regression Analysis
- Factor Analysis
- Time Series Analysis

### 3. Matrix Operations
- Basic Matrix Operations
- Eigenvalue Decomposition
- Matrix Transformations
- Linear Algebra Utilities

## 🚀 Getting Started

### Prerequisites
- LaTeX distribution (TeXLive 2021 or later recommended)
- LuaTeX engine
- Basic understanding of LaTeX and statistics

### Installation
```bash
# Clone the repository
git clone https://github.com/YourUsername/LuaStats.git

# Add to your LaTeX project
\usepackage{luastats}
```

### Basic Usage
```latex
\documentclass{article}
\usepackage{luastats}

\begin{document}
% Basic Statistical Calculations
\luastatMean{1, 2, 3, 4, 5}
\luastatVariance{1, 2, 3, 4, 5}

% ANOVA Table
\begin{luastatANOVA}
    \data{{{0,-6,3,6,-3},{-4,-1,-6,1,5},{8,-2,5,0,5}}}
    \printTable
\end{luastatANOVA}
\end{document}
```

## 📚 Documentation

### Learning Path
1. **Basics of Lua Programming**
   - Variables and Data Types
   - Control Structures
   - Functions and Tables
   - Mathematical Operations

2. **Statistical Computing in Lua**
   - Implementing Statistical Formulas
   - Matrix Operations
   - Probability Distributions
   - Statistical Tests

3. **LaTeX Integration**
   - LuaTeX Basics
   - Package Development
   - Document Interface Design
   - Error Handling

## 📖 Examples

### Example 1: Two-way ANOVA
```latex
\begin{luastatExample}
\begin{luastatANOVA}
    % Your ANOVA data and calculations here
\end{luastatANOVA}
\end{luastatExample}
```

### Example 2: Regression Analysis
```latex
\begin{luastatRegression}
    % Your regression analysis here
\end{luastatRegression}
```

## 🔬 Research Applications

This package is particularly useful for:
- Academic Research Papers
- Statistical Reports
- Data Analysis Documentation
- Educational Materials
- Research Reproducibility

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 📧 Contact

- Author: [Anupam Maurya](https://github.com/Anupam-Maurya)
- Email: [anupammaurya23092001@gmail.com](mailto:anupammaurya23092001@gmail.com)
- Project Link: [GitHub Repository URL](https://github.com/Anupam-Maurya/LuaStats)

## 🙏 Acknowledgments

- Statistical Computing Community
- LaTeX Development Team
- Academic Advisors and Mentors
- Open Source Contributors

## 📚 References

1. Knuth, Donald E. "The TeXbook"
2. Statistical Computing with Lua
3. Modern LaTeX Package Development
4. [Additional relevant references]

---
**Note**: This package is part of MSc Statistics research work and is continuously being updated with new features and improvements.

