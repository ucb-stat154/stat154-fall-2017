## stat154-fall-2017

This repository holds the course materials for the Fall 2017 edition of 
__Statistics 154: Modern Statistical Prediction and Machine Learning__ at UC Berkeley.


- __Instructor:__ [Gaston Sanchez](http://gastonsanchez.com),  gaston.stat [at] gmail.com
- __Class Time:__ MWF 1-2pm in [3108 Etcheverry](http://www.berkeley.edu/map?etcheverry)
- __Session Dates:__ 08/23/17 - 12/08/17
- __Code #:__ 20978
- __Units:__ 4 (more info [here](http://classes.berkeley.edu/content/2017-fall-stat-154-001-lec-001))
- __Office Hours:__ MW 2:10-3:00pm in 309 Evans (or by appointment)
- __Final:__ TBA
- __GSI:__ [Johnny Hong](http://jcyhong.github.io/) (OH 428 Evans: Tu 9-11am, Th 1-3pm). 


| Lab | Date         | Room         | GSI             |
|-----|--------------|--------------|-----------------|
| 101 | M 9am-11am   | 330 Evans    | Johnny Hong     |
| 102 | M 11am-1pm   | 330 Evans    | Johnny Hong     |



### Description

This is an introductory-level course in supervised learning, with a focus on regression and classification methods. The [syllabus](syllabus) includes: linear regression, model assessment, model selection, regularization methods (pcr, plsr, ridge and lasso); logistic regression and  discriminant analysis; cross-validation and the bootstrap; tree-based methods, random forests and boosting; support-vector machines. Some unsupervised learning methods are discussed: principal components and clustering (k-means and hierarchical).

In this course, we will explore the predictive modeling lifecycle, including question formulation, data preprocessing, exploratory data analysis and visualization, model building, model assessment/validation, model selection, and decision-making.​ 

We will focus on quantitative critical thinking​ and key principles needed to carry out this cycle. 1) Foundational principles for building predictive models; 2) Intuitive explanations of many commonly used predictive modeling techniques for both classification and regression problems; 3) Principles and steps for validating a predictive model; and 4) write and use computer code to perform the necessary foundational work to build and validate predictive models.



### Contents

The course focuses on predictive models, and it covers the following 
topics (not necessarily in the displayed order):

- Process of predictive model building
- Data Preprocessing
- Regression Models
    + Linear models
    + Non-linear models (time permitting)
    + Tree-based methods
- Classification Models
    + Linear models
    + Non-linear models
    + Tree-based methods
    + Support Vector Machines (time permitting)
- Unsupervised methods like PCA and Clustering
- Data spending: splitting and resampling methods
- Model Evaluation
- Model Selection



### Prerequisites / Review

- Multivariate calculus or the equivalent, esp. partial derivatives; e.g. Math 53
- Linear algebra or the equivalent (matrices, vector spaces); e.g. Math 54
- Statistical inference or the equivalent; e.g. Stat 135
- Scripting experience in R required; e.g. Stat 133

This course will build on a lot of material from matrix algebra. In particular, you should be comfortable with notions such as vector spaces, inner products, norms, matrix products/transpose/rank/determinants/inverses, as well as matrix decompositions. 

You should also have some scripting experience---preferably in R---at the level of writing functions, conditionals (if-then-else structures), for loops, while loops, sampling, read in data sets, export results.

Last but not least, it is nice to know the basics of Rmd files, as well as some knowledge of LaTeX, especially some experience writing math symbols and equations.



### Textbooks

The primary text is __An Introduction to Statistical Learning__ (ISL) by James, Witten, Hastie, and Tibshirani. Springer, 2013. It is freely available online in pdf format (courtesy of the authors) at [http://www-bcf.usc.edu/~gareth/ISL/](http://www-bcf.usc.edu/~gareth/ISL/).

As companion material, especially for the labs, R code and projects, we will also be using __Applied Predictive Modeling__ by Max Kuhn and Kjell Johnson. Springer, 2013.

Other good (optional) references for the course are:

- __The Elements of Statistical Learning__ by Hastie, Tibshirani and Friedman. Springer, 2009 (2nd Ed). This book is more mathematically-and-conceptually advanced than ISL. It is freely available online in pdf format (courtesy of the authors) at [https://statweb.stanford.edu/~tibs/ElemStatLearn/](https://statweb.stanford.edu/~tibs/ElemStatLearn/). This text will not be used directly for this course and is simply a reference for more theoretical details.

- __Data Mining and Statistics for Decision Making__ by Stephane Tuffery. Wiley 2011.
This book should be in electronic format via the UCB Library Catalog. If the course slides are not self-explanatory enough, you can supplement them with this little known, yet excellent resource.

- __Statistical Learning from a Regression Perspective__ by Richard Berk. Springer 2008.
You can find this book in electronic format via the UCB Library Catalog. This text will not be used directly for this course and is simply a reference for more theoretical details.



### Expectations

We expect that at the end of the course you:

- Have a basic, yet solid, understanding of the prediction modeling process/lifecycle.
- Be able to read a well-described algorithm, and write code to implement it 
computationally (in R).
- Know the pros and cons of each predictive technique.
- Be able to describe (to non-professionals) what a predictive technique is doing.



### Methods of Instruction

- We will be using a combination of materials such as slides, tutorials, 
reading assignments, and chalk-and-talk.
- The main computational tool will be the [computing and programming environment R](https://www.r-project.org/). 
- The main workbench will be the IDE [RStudio](https://www.rstudio.com/).
You will also use a terminal emulator to work with the command line.



### Other

- Please read the course [logistics and policies](syllabus/policies.md) for mode details
about the structure of the course, DO's and DONT's, etc.



-----

### License

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />Unless otherwise noticed, this work, by Gaston Sanchez, is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.

Author: [Gaston Sanchez](http://gastonsanchez.com)
