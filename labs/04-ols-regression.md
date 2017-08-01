Lab 4: Least Squares Regression
================
Prof. Gaston Sanchez
Stat 154, Fall 2017

Introduction
============

In this lab, we are going to review the function `lm()` for OLS regression. You will also have the opportunity (challenge?) to write code in R that computes OLS solution. We will focus on obtaining regression coefficients, fitted values (i.e. predicted values), and Residual Sum of Squares (RSS). We leave the inferential aspects for next lab.

Simple Regression
=================

In R, the function that allows us to fit a regression model via Least Squares is `lm()`, which stands for *linear model*. I should say that this function is a general function that works for various types of linear models, not just simple linear regression.

The main arguments to `lm()` are:

``` r
lm(formula, data, subset, na.action)
```

where:

-   `formula` is the model formula (the only required argument)
-   `data` is an optional data frame
-   `subset` is an index vector specifying a subset of the data to be used (by default all items are used)
-   `na.action` is a function specifying how missing values are to be handled (by default missing values are omitted)

When the predictors and the response variable are all in a single data frame, you can use `lm()` as follows:

``` r
# run regression analysis
reg <- lm(mpg ~ disp, data = mtcars)
```

The first argument of `lm()` consists of an R formula: `mpg ~ disp`. The tilde, `~`, is the formula operator used to indicate that `mpg` *depends* or is *described* by `disp`.

The second argument, `data = mtcars`, is used to indicate the name of the data frame that contains the variables `mpg` and `disp`, which in this case is the object `mtcars`. Working with data frames and using this argument is strongly recommended.

The example above is a simple linear regression (i.e. only one predictor). To fir a multiple linear model, just include more predictors:

``` r
reg <- lm(mpg ~ disp + hp, data = mtcars)
```

About Model Formulae
--------------------

The `formula` declaration in `lm()` were originally introduced as a way to specify linear models, but have since been adopted for so many other purposes. A formula has the general form:

``` r
response ~ expression
```

where the left-hand side, `response`, may in some uses be absent and the right-hand side, `expression`, is a collection of terms joined by operators usually resembling an arithmetical expression. The meaning of the right-hand side is context dependent.

The `formula` is interpreted in the context of the argument `data` which must be a list, usually a data frame; the objects named on either side of the formula are looked for first in `data` and then searched for in the usual way. So, the following calls to `lm()` are equivalent:

``` r
# with argument 'data'
lm(mpg ~ disp + hp, data = mtcars)

# without argument 'data'
lm(mtcars$mpg ~ mtcars$disp + mtcars$hp)
```

Notice that in these cases the `+` indicates inclusion, not addition. You can also use `-` which indicates exclusion.

Output of `lm()`
----------------

Let's consider the previous example:

``` r
reg <- lm(mpg ~ disp + hp, data = mtcars)
```

We are storing the output of `lm()` in the object `reg`. Technically, `reg` is an object of class `"lm"`. Let's take a look at `reg`:

``` r
# default output
reg
```

    ## 
    ## Call:
    ## lm(formula = mpg ~ disp + hp, data = mtcars)
    ## 
    ## Coefficients:
    ## (Intercept)         disp           hp  
    ##    30.73590     -0.03035     -0.02484

The first part of the output simply tells you the command used to run the analysis, in this case: `lm(formula = mpg ~ disp, data = mtcars)`.

The second part of the output shows information about the regression coefficients. The intercept is 30.736 and the slope is -0.03. Observe the names used by R to display the intercept *b*<sub>0</sub>, and the slope *b*<sub>1</sub>. While the intercept has the same name `(Intercept)`, the slope is displayed with the name of the associated variable, `disp`.

The printed output of `reg` is kind of minimalist. However, `reg` contains more information. To see a list of the different components in `reg`, use the function `names()`:

``` r
names(reg)
```

    ##  [1] "coefficients"  "residuals"     "effects"       "rank"         
    ##  [5] "fitted.values" "assign"        "qr"            "df.residual"  
    ##  [9] "xlevels"       "call"          "terms"         "model"

As you can tell, `reg` contains many more things than just the `coefficients`. Here's a short description of each of the output elements:

-   `coefficients`: a named vector of coefficients.
-   `residuals`: the residuals, that is, response minus fitted values.
-   `fitted.values`: the fitted mean values.
-   `rank`: the numeric rank of the fitted linear model.
-   `df.residual`: the residual degrees of freedom.
-   `call`: the matched call.
-   `terms`: the terms object used.
-   `model`: if requested (the default), the model frame used.

To inspect what's in each returned component, type the name of the regression object, `reg`, followed by the `$` dollar operator, followed by the name of the desired component. For example, to inspect the `coefficients` run this:

``` r
# regression coefficients
reg$coefficients
```

    ## (Intercept)        disp          hp 
    ## 30.73590425 -0.03034628 -0.02484008

For the purposes and scope of this course, the important output of an `"lm"` object are the elements `coefficients`, `residuals`, and `fitted.values`.

Plotting the Regression Line
----------------------------

Having obtained the `"lm"` object `reg`, we can use it to get a scatterplot with the regression line on it. The simplest way to achieve this visualization is to first create a scatter diagram with `plot()`, and then add the regression line with the function `abline()`; here's the code in R:

``` r
# scatterplot with regression line
plot(dat$disp, dat$mpg)
```

    ## Error in plot(dat$disp, dat$mpg): object 'dat' not found

``` r
abline(reg, lwd = 2)
```

    ## Warning in abline(reg, lwd = 2): only using the first two of 3 regression
    ## coefficients

    ## Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...): plot.new has not been called yet

The function `abline()` allows you to add lines to a `plto()`. The good news is that it recognizes objects of class `"lm"`, and when invoked after a `plot()` is created, it will add the regression line. Again, to get a nicer plot, you can do something like this:

``` r
# scatterplot with regression line
plot.new()
plot.window(xlim = c(58, 80), ylim = c(58, 80))
points(dat$disp, dat$mpg, pch = 20, cex = 0.5)
```

    ## Error in points(dat$disp, dat$mpg, pch = 20, cex = 0.5): object 'dat' not found

``` r
abline(reg, col = "tomato", lwd = 2)   # regression line
```

    ## Warning in abline(reg, col = "tomato", lwd = 2): only using the first two
    ## of 3 regression coefficients

``` r
axis(side = 1, pos = 58, at = seq(58, 80, 2))
axis(side = 2, las = 1, pos = 58, at = seq(58, 80, 2))
```

<img src="04-ols-regression_files/figure-markdown_github/unnamed-chunk-9-1.png" width="60%" style="display: block; margin: auto;" />

OLS solution
============

We can get the regression parameters, using **(****X**<sup>T</sup>**X****)**<sup>**−****1**</sup>**X**<sup>T</sup>**y**

``` r
# beta coefficients
XtXi <- solve(t(X) %*% X)
XtXi %*% t(x) %*% y
```

Although this works, computationally it is not the best way to compute **b**. Why? Because it is inefficient and be very inaccurate when the predictors are strongly correlated.

A better, but not perfect, way is to use:

``` r
solve(crossprod(X, X), crossprod(X, y))
```

Here we get the same result as `lm()` because the data are well-behaved. In practice, I recommend to use packaged functions like `lm()` which uses QR decomposition.

QR Decomposition
----------------

Any matrix can be written as:

**X** **=** **Q****R**

where:

-   **Q** is an *n* × *n* orthogonal matrix
-   **R** is a *p* × *p* upper triangular matrix

``` r
QR <- qr(X)
```

To extract the matrices of the decomposition, you have to use the companion functions `qr.Q()` and `qr.R()`

``` r
Q <- qr.Q(QR)
R <- qr.R(QR)
```

``` r
f <- t(Q %*% y)
```

Solving **R****b** **=** **f** we use the method of backsubstitution:

``` r
backsolve(R, f)
```
