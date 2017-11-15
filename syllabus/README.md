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
- __Reading__: ISL 1 & 2; APM 1
    + [Statistical Modeling: The Two Cultures](../papers/Breiman_2001_Statistical_Modeling_Two_Cultures.pdf) by Leo Breiman (2001)

-----

## Matrix Algebra Housekeeping

- __Dates__: Aug 28-Sep 01
- __Topics__: Quick review of objects and functions in R to handle common (and not so common) matrix operations. Review of how to express basic statistical operations with vector-matrix notation, and discuss their geometric interpretations. Description of the data matrix, its rows-and-columns duality, and various types of cross-products.
- __Slides__:
    + [Matrices in R](../slides/02-matrix-in-R.pdf)
    + [Statistical operations with vector-matrix notation](../slides/03-matrix-stat-operations1.pdf)
    + [The duality of the data matrix](../slides/04-matrix-stat-operations2.pdf), and common cross-products X'X and XX'
- __Lab 1__: [Warm-up with matrices in R](../labs/lab01-matrix-practice.pdf) (Aug-28)

-----

## Matrix Decompositions in R

- __Dates__: Sep 04-08 (_Holiday Sep-04_)
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
    + [More about PCA](../slides/09-principal-components3.pdf) (properties and derived results)
- __Reading__: ISL 10; APM 3
    + [PCA](../papers/Abdi_2010_Principal_Component_Analysis.pdf) paper by Herve Abdi and Lynne Williams (2010)
- __Lab 3__: [PCA in R](../labs/lab03-principal-components.pdf) (Sep-18)
- __Assignment 1:__ [Problem Set 1](../problems/problems1.pdf) (due: Sep-12 before midnight)

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
- __Assignment 2:__ [Problem Set 2](../problems/problems2.pdf) (due: Sep-21 before midnight)

-----

## Statistical Learning Ideas for Regression

- __Dates__: Sep 25-29
- __Topics__: After OLS regression, we cover fundamental Statistical Learning concepts such as measures for model performance, overfitting, training and test datasets, and resampling methods.
These building blocks will allow you to better understand the alternative approaches for linear regression. 
- __Slides__:
    + [Inferential Aspects in OLS Regression](../slides/13-inference-regression.pdf)
    + [Model Performance, Overfitting, and Training-Test sets](../slides/14-esl-regression-ideas.pdf)
    + [Multicollinearity issues](../slides/15-multicollinearity-issues.pdf)
- __Reading__: ISL 2 & 5; APM 4;
    + [Models for understanding vs models for prediction](../papers/Saporta_2008_Models_for_Understanding_vs_Models_for_Prediction.pdf) by Gilbert Saporta (2008)
- __Lab 5__: [More OLS and resampling with R](../labs/lab05-inference-regression) (Oct-02)

-----

## Regression: Dimension Reduction Methods

- __Dates__: Oct 02-06
- __Topics__: Pre-processing predictors via PCA prior to performing regression is known as Principal Component Regression (PCR). Partial Least Squares Regression (PLSR) also finds linear combinations of the predictors that maximally summarize tha variation of the predictors while simultaneously requiring these components to have maximum correlation with the response. 
- __Slides__:
    + [Principal Components Regression](../slides/16-pc-regression.pdf) (PCR)
    + [Partial Least Squares Regression 1](../slides/17-pls-regression1.pdf) (PLSR) part 1
    + [Partial Least Squares Regression 2](../slides/18-pls-regression2.pdf) (PLSR) part 2
- __Reading__: ISL 6.3; APM 6.3
- __Lab 6__: [PCR and PLSR](../labs/lab06-pcr-pls-regression.pdf) (Oct-09)
- __Assignment 3:__ [Problem Set 3](../problems/problems3.pdf) (due: Oct-05 before midnight)

-----

## Regression: Penalized Methods

- __Dates__: Oct 09-13
- __Topics__: One method of creating biased regression models is to add a penalty to the sum of squared residuals. This is done to control the magnitude of the parameters. By sacrificing some bias, we can often reduce the variance enough to make the overall MSE lower than unbiased models. 
- __Slides__:
    + [Ridge Regression](../slides/19-ridge-regression.pdf) (RR)
    + [Regularization](../slides/20-regularization.pdf) (slides by Hastie and Tibshirani)
        + Variable Selection
        + Least Absolute Shrinkage and Selection Operator (Lasso)
- __Reading__: ISL 6.2; APM 6.4
- __Lab 7__: [RR and Lasso](../labs/lab07-ridge-lasso.pdf) (Oct-16)

-----

## Regression Overview and transition to Classification

- __Dates__: Oct 16-20
- __Topics__: Overview of linear regression models with discussion of a set of continuum regression approaches. We will also transition into Classification methods with the introduction to Logistic Regression.
- __Slides__:
    + Continuum Regression Discussion (chalk and talk)
    + [Logistic Regression (part I)](../slides/22-logistic-regression1.pdf)
    + [Logistic Regression (part II)](../slides/23-logistic-regression2.pdf)
- __Reading__: ISL 4.1-4.3; APM 12.2
- __Lab 8__: [Logistic Regression](../labs/lab08-logistic-regression.pdf) (Oct-23)
- __Assignment 4:__ [Problem Set 4](../problems/problems4.pdf) (due: Oct-20 before midnight)
- __MIDTERM 1__: Friday Oct-20

-----

## Classification: Geometric Discriminant Analysis

- __Dates__: Oct 23-27
- __Topics__: The origins and foundations of Discriminant Analysis (DA) are based on Ronald Fisher's geometric approach. This can be considered as classification with an unsupervised touch.
- __Slides__:
    + [Preamble to Discriminant Analysis](../slides/24-discriminant-preamble.pdf)
    + [Geometric Discriminant Analysis (part I)](../slides/25-geometric-discriminant1.pdf)
    + [Geometric Discriminant Analysis (part II)](../slides/26-geometric-discriminant2.pdf)
- __Reading__: ISL 4.4; APM 12.3
- __Lab 9__: [Discriminant Analysis](../labs/lab09-lda-qda.pdf) (Oct-30)

-----

## Classification: Probabilistic Discriminant Analysis

- __Dates__: Oct 30-Nov 03
- __Topics__: Presentation of the probabilistic framework for classiciation purposes with the so-called Bayes Classifier. We move on from geometric DA to Probabilistic DA, and also discuss the non-parametric method kNN.
- __Slides__:
    + [Classification](../slides/27-classification.pdf) (slides by Hastie and Tibshirani)
        + Bayes Classifier
        + Linear and Quadratic Discriminant Analysis
        + K-Nearest Neighbors (kNN)
- __Reading__: ISL 4.4; APM 13.5
- __Lab 10__: [Comparing Classification Methods](../labs/lab10-knn.pdf) (Nov-06)
- __Assignment 5:__ [Problem Set 5](../problems/problems5.pdf) (due: Nov-05 before midnight)

-----

## Classification: Statistical Learning Concepts

- __Dates__: Nov 06-10
- __Topics__: Summary of classifications methods, and introduction to decision trees.
- __Slides__:
    + Discriminant Analysis Synthesis (chalk and talk)
    + [Classification Performance Measures](../apps/roc-curve/roc-curve-apm.md)
    + [Introduction to Decision Trees](../slides/28-trees-introduction.pdf)
- __Reading__: ISL 4, APM 11
- __Lab 11__: [ROC Curve and SVM](../labs/lab11-svm.pdf) (Nov-13)

-----

## Tree-based Methods

- __Dates__: Nov 13-17
- __Topics__: Tree-based methods.
- __Slides__:
    + [More about decision trees](../slides/29-decision-trees.pdf)
    + [Intro to `rpart`](../papers/Intro-to-rpart.md)
    + Random Forests
    + Boosting, Bagging
- __Reading__: ISL 8; APM 8
- __Lab 12__: TBA (Nov-20)
- __MIDTERM 2__: Friday Nov-17

-----

## Clustering

- __Dates__: Nov 27-Dec 01
- __Topics__: Clustering.
- __Slides__:
    + Hierarchical Clustering (part 1)
    + Hierarchical Clustering (part 2)
    + K-means clustering
- __Reading__: ISL 10
- __Lab 12__: TBA (Nov-27)
