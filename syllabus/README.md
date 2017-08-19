## Syllabus, Stat 154

+ Notes:
	- Tentative calendar (weekly topics), subject to changes depending on the pace of the course.
	- Labs: For the covered topics in a given week, the associated lab takes place on Monday of the following week.
	- ISL = _An Introduction to Statistical Learning_ (by James et al, 2015)
	- APM = _Applied Predictive Modeling_ (by Kuhn and Johnson, 2013)

-----

## Course Introduction

- __Dates__: Aug 23-25
- __Topics__: Introduction, policies/logistics, and course in a nutshell
- __Slides__:
    + [About the course](../slides/00-course-info.pdf)
    + [Introduction](../slides/01-introduction.pdf)

-----

## Matrix Algebra Housekeeping

- __Dates__: Aug 28-Sep 01
- __Topics__: Quick review of objects and functions in R to handle common (and not so common) matrix operations. Review of how to express basic statistical operations with vector-matrix notation, and discuss their geometric interpretations. Description of the data matrix, its rows-and-columns duality, and various types of cross-products.
- __Slides__:
    + [Matrices in R](../slides/02-matrix-in-R.pdf)
    + [Statistical operations with vector-matrix notation](../slides/03-matrix-stat-operations1.pdf)
    + [The duality of the data matrix](../slides/04-matrix-stat-operations2.pdf), and common cross-products X'X and XX'
- __Lab 1__: [Warm-up with matrices in R](../labs/lab01-matrix-practice.pdf) (Sep-04 on your own)

-----

## Matrix Decompositions in R

- __Dates__: Sep 04-08
- __Topics__: Review of matrix Decompositions with R, talking about the functions `svd()` and `eigen()`, the implications of the decompositions, data reduction, and visual displays.
- __Slides__:
    + [Singular Value Decomposition (SVD)](../slides/05-matrix-svd.pdf)
    + [Eigenvalue Decomposition (EVD)](../slides/06-matrix-eigen.pdf)
- __Lab 2__: [Matrix decompositions and the power algorithm](../labs/lab02-matrix-decompositions.pdf) (Sep-11)

-----

## Principal Components Analysis (PCA)

- __Dates__: Sep 11-15
- __Topics__: Principal Components Analysis is an unsupervised learning approach for studying the systematic structure of a data set (of quantitative variables). How PCA is connected with the SVD and EVD decompositions, interpretation of the outputs, and usefulness for Exploratory Data Analysis.
- __Slides__:
    + [Introduction to PCA](../slides/07-principal-components1.pdf)
    + [Painstaking PCA](../slides/08-principal-components2.pdf)
    + More about PCA (properties and derived results)
- __Reading__: ISL 10; APM 3
- __Lab 3__: [PCA in R](../labs/lab03-principal-components.pdf) (Sep-18)

-----

## Regression via Least Squares

- __Dates__: Sep 18-22
- __Topics__: Introduction to Regression Analysis and the classic Linear Model framework. We begin with a bit of history, and then present the Least Squares minimization problem for both simple and multiple regression without any stochastic assumptions, just plain algebra, calculus and geometry. We also talk about some computational aspects about least squares.
- __Slides__:
    + [A bit of history](../slides/10-history-regression.pdf)
    + [Simple OLS regression](../slides/11-ols-regression1.pdf)
    + [Multiple OLS regression](../slides/12-ols-regression2.pdf)
- __Reading__: ISL 3; APM 6.1-6.2
- __Lab 4:__ [OLS regression](../labs/lab04-ols-regression.pdf) (Sep-25)

-----

## Statistical Learning Ideas for Regression

- __Dates__: Sep 25-29
- __Topics__: After OLS regression, we cover fundamental Statistical Learning concepts such as measures for model performance, overfitting, training and test datasets, and resampling methods.
These building blocks will allow you to better understand the alternative approaches for linear regression. 
- __Slides__:
    + [Inferential Aspects in OLS Regression](../slides/13-inference-regression.pdf)
    + Model Performance, Overfitting, and Training-Test
    + [Multicollinearity issues](../slides/15-multicollinearity-issues.pdf)
- __Reading__: ISL 2 & 5; APM 4;
    + [Saporta (2008) Models for understanding vs models for prediction](../papers/Saporta_2008_Models_for_Understanding_vs_Models_for_Prediction.pdf)
- __Lab 5__: More OLS stuff with R (Oct-02)

-----

## Regression: Dimension Reduction Methods

- __Dates__: Oct 02-06
- __Topics__: Pre-processing predictors via PCA prior to performing regression is known as Principal Component Regression (PCR). Partial Least Squares Regression (PLSR) also finds linear combinations of the predictors that maximally summarize tha variation of the predictors while simultaneously requiring these components to have maximum correlation with the response. 
- __Slides__:
    + Principal Components Regression (PCR)
    + [Partial Least Squares Regression](../slides/17-pls-regression1.pdf) (PLSR) part 1
    + Partial Least Squares Regression (PLSR) part 2
- __Reading__: ISL 6.3; APM 6.3
- __Lab 6__: PCR and PLSR (Oct-09)

-----

## Regression: Penalized Methods

- __Dates__: Oct 09-13
- __Topics__: One method of creating biased regression models is to add a penalty to the sum of squared residuals. This is done to control the magnitude of the parameters. By sacrificing some bias, we can often reduce the variance enough to make the overall MSE lower than unbiased models. 
- __Slides__:
    + Ridge Regression (RR)
    + Least Absolute Shrinkage and Selection Operator (Lasso)
    + Extensions of penalized models
- __Reading__: ISL 6.2; APM 6.4
- __Lab 7__: RR and Lasso (Oct-16)

-----

## Regression Overview and transition to Classification

- __Dates__: Oct 16-20
- __Topics__: Overview of linear regression models with discussion of a set of continuum regression approaches. We will also transition into Classification methods with the introduction to Logistic Regression.
- __Slides__:
    + Continuum Regression
    + [Logistic Regression (part I)](../slides/22-logistic-regression1.pdf)
- __Reading__: ISL 4.1-4.3; APM 12.2
- __Lab 8__: Logistic Regression (Oct-23)

-----

## Classification: Geometric Discriminant Analysis

- __Dates__: Oct 23-27
- __Topics__: The origins and foundations of Discriminant Analysis (DA) are based on Ronald Fisher's geometric approach. This can be considered as classification with an unsupervised touch.
- __Slides__:
    + [Logistic Regression (part II)](../slides/23-logistic-regression2.pdf)
    + [Preamble to Discriminant Analysis](../slides/24-discriminant-preamble.pdf)
    + [Geometric Discriminant Analysis](../slides/25-geometric-discriminant-analysis.pdf)
- __Reading__: ISL 4.4; APM 12.3
- __Lab 9__: TBA (Oct-30)

-----

## Classification: Probabilistic Discriminant Analysis

- __Dates__: Oct 30-Nov 03
- __Topics__: Presentation of the probabilistic framework for classiciation purposes with the so-called Bayes Classifier. We move on from geometric DA to Probabilistic DA, and also discuss the non-parametric method kNN.
- __Slides__:
    + Bayes Classifier
    + Linear and Quadratic Discriminant Analysis
    + K-Nearest Neighbors (kNN)
- __Reading__: ISL 4.4; APM 13.5
- __Lab 10__: TBA (Nov-06)
