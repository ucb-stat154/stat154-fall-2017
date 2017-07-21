## Syllabus, Stat 154

Tentative calendar, Fall 2017 (weekly topics)

- Labs: For the covered topics in a given week, the associated lab takes place on Monday of the following week.
- ISL = _An Introduction to Statistical Learning_ (by James et al, 2015)
- APM = _Applied Predictive Modeling_ (by Kuhn and Johnson, 2013)


-----

## Course Introduction

- __Dates__: Aug 23-25
- __Topics__: Introduction, policies/logistics, and course in a nutshell
- __Slides__:
    + Course in a nutshell
    + Short tour

-----

## Matrix Algebra Housekeeping

- __Dates__: Aug 28-Sep 01
- __Topics__: Quick review of objects and functions in R to handle common (and not so common) matrix operations. Review of how to express basic statistical operations with vector-matrix notation, and discuss their geometric interpretations. Description of the data matrix, its rows-and-columns duality, and the various types of cross-products.
- __Slides__:
    + Matrix operations in R
    + Statistical operations with vector-matrix notation
    + The duality of the data matrix, and common cross-products X'X and XX'
- __Lab 1__: Matrix stuff (on your own)

-----

## Matrix Decompositions in R

- __Dates__: Sep 04-08
- __Topics__: Review of matrix Decompositions with R, talking about the functions `svd()` and `eigen()`, the implications of the decompositions, data reduction, and visual displays.
- __Slides__:
    + Singular Valude Decomposition (SVD)
    + Eigenvalue Decomposition (EVD)
- __Lab 2__: Matrix decompositions and the power algorithm

-----

## Principal Components Analysis (PCA)

- __Dates__: Sep 11-15
- __Topics__: Principal Components Analysis. Unsepervised learning approach for studying the structure of a data set (of quantitative variables). How PCA is connected with the SVD and EVD decompositions, interpretation of the outputs, and usefulness for Exploratory Data Analysis.
- __Slides__:
    + PCA from a maximizing variance perspective 
    + PCA from a geometric perspective
    + Applying PCA
- __Reading__: ISL 10; APM 3
- __Lab 3__: A bit of EDA and PCA

-----

## Regression via Least Squares

- __Dates__: Sep 18-22
- __Topics__: Introduction to Regression Analysis and the classic Linear Model framework. We begin with a bit of history, and then present the Least Squares minimization problem for both simple and multiple regression without any stochastic assumptions, just plain algebra, calculus and geometry. We also talk about some computational aspects to compute least squares.
- __Slides__:
    + A bit of history
    + Simple OLS regression
    + Multiple OLS regression
- __Reading__: ISL 3; APM 6.1-6.2
- __Lab 4:__ OLS regression

-----

## Statistical Learning Ideas for Regression

- __Dates__: Sep 25-29
- __Topics__: After OLS regression, we cover fundamental Statistical Learning concepts such as measures for model performance, overfitting, training and test datasets, and resampling methods.
These biulding blocks will allow you to better understand the alternative approaches for linear regression. 
- __Slides__:
    + Inferential Aspects
    + Model Performance, Overfitting, and Training-Test
    + Multicollinearity
- __Reading__: ISL 2 & 5; APM 4
- __Lab 5__: More OLS stuff with R

-----

## Linear Regression: Dimension Reduction Methods

- __Dates__: Oct 02-06
- __Topics__: Pre-processing predictors via PCA prior to performing regression is known as Principal Component Regression (PCR). Partial Least Squares Regression (PLSR) also finds linear combinations of the predictors that maximally summarize tha variation of the predictors while simultaneously requiring these components to have maximum correlation with the response. 
- __Slides__:
    + Principal Components Regression (PCR)
    + Partial Least Squares Regression (PLSR)
- __Reading__: ISL 6.3; APM 6.3
- __Lab 6__: PCR and PLSR

-----

## Linear Regression: Penalized Methods

- __Dates__: Oct 09-13
- __Topics__: One method of creating biased regression models is to add a penalty to the sum of squared residuals. This is done to control to magnitude of the parameters. By sacrificing some bias, we can often reduce the variance enough to make the overall MSE lower than unbiased models. 
- __Slides__:
    + Ridge Regression (RR)
    + Least Absolute Shrinkage and Selection Operator (Lasso)
    + Extensions of penalized models
- __Reading__: ISL 6.2; APM 6.4
- __Lab 7__: RR and Lasso

