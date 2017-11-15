Partition Trees with `rpart`
================
Gaston Sanchez

> ### Learning Objectives:
>
> -   Introduction to the `rpart()` function
> -   Understand parameters
> -   Understand control parameters

------------------------------------------------------------------------

Decision Trees in R
-------------------

The source code of the CART (Classification and Regression Trees) method, developed by Jerome Friedman, is proprietary software of Salford Systems. However, a close implementation of CART in R is provided by the package `"tree"` and the more famous package `"rpart"`.

``` r
# install.packages("rpart")
library(rpart)
```

Function `rpart()`
------------------

The main function of `"rpart"` is the homonym function `rpart()` which allows you to build both classification and regression trees.

There are several ways in which you can use `rpart()`. So let's review its bells and whistles.

The three main arguments that you should pass to `rpart()` are:

1.  a `formula` indicating the response and the predictor variables
2.  a `data` frame containing the variables
3.  a `method` specifying whether a regression tree (`method = "anova"`) or a classifiction tree (`method = "class"`) should be computed.

For illustration purposes, let's see how to invoke `rpart()` to fit a classification tree for `Species` with the `iris` data set:

``` r
# classification tree
tree0 <- rpart(Species ~ ., data = iris, method = "class")
```

`rpart()` returns an object of class `"rpart"` that, when printed, displays some information about the obtained tree and its nodes:

``` r
# rpart object
tree0
```

    ## n= 150 
    ## 
    ## node), split, n, loss, yval, (yprob)
    ##       * denotes terminal node
    ## 
    ## 1) root 150 100 setosa (0.33333333 0.33333333 0.33333333)  
    ##   2) Petal.Length< 2.45 50   0 setosa (1.00000000 0.00000000 0.00000000) *
    ##   3) Petal.Length>=2.45 100  50 versicolor (0.00000000 0.50000000 0.50000000)  
    ##     6) Petal.Width< 1.75 54   5 versicolor (0.00000000 0.90740741 0.09259259) *
    ##     7) Petal.Width>=1.75 46   1 virginica (0.00000000 0.02173913 0.97826087) *

As you can tell from the output of `rpart()`, there are three main pieces of information:

-   The first line shows the total number of individuals in the root node: `n = 150`

-   The second line shows the labels (legends) `node), split, n, loss, yval, (yprob)` to be used when reading the third part of the output:

-   The third (and major) part of the output shows all the nodes in the tree; starting with the first node which is the root node; the numbers inside the parentheses correspond to the class proportions.

Tree-based models automatically select the more relevant variables. This means that not all variable need to appear in the tree. In the previous example, only the variables `Petal.Length` and `Petal.Width` are used to fit the tree.

You read the tree output from the *root node* that is marked with the number `1)`. The `print()` method associated to an object `"rpart"` provides some information of the data in this node. Namely, we can observe that we have 150 observations at this node, of which 100 have a different class from `setosa`, and the corresponding relative frequencies (or probabilities) of each class.

Each node of a tree has two branches or partitions. For instance, from the root node we have a branch `2)` where the split criterion is `Petal.Length< 2.45`. If an observation has `Petal.Length< 2.45`, then it is labeled as class `setosa`. In fact, all samples are of the same class. Likewise, from node `3)` the split condition is `Petal.Length>=2.45`, and two more nodes are derived from this partition: `6)` and `7)`.

### `plot()`ing a tree

In addition to the `print()` method of an object of class `"rpart"`, there is also a `plot()` method that produces a visual display of the tree. By the way, when plotting an `"rpart"` tree you will also need to call `text()`:

``` r
# basic (ugly) tree plot
plot(tree0)
text(tree0)
```

![](Intro-to-rpart_files/figure-markdown_github/plot_rpart-1.png)

As you can tell, the output of `plot()` and `text()` tends to be kind of ugly. `plot()` controls the graphical representation of the tree, the layout of the nodes, their spacing, the form of the branches, and the margins of the graphic. `text()`, on the other hand, adds labels and numeric information.

To get a prettier tree, you may want to tweak the `margin` of the plot figure, and set to `TRUE` various parameters of `text()`:

``` r
# less basic tree plot
plot(tree0, margin = 0.15)
text(tree0, fancy = TRUE, use.n = TRUE, all = TRUE)
```

![](Intro-to-rpart_files/figure-markdown_github/plot_rpart2-1.png)

-   `all = TRUE` labels all nodes
-   `fancy = TRUE` shows internal nodes as ellipses, and the terminal nodes (i.e. the leafs) as rectangles
-   `use.n = TRUE` displays the number of observations of each class

Here's another option to plot a tree:

``` r
# another less basic tree plot
plot(tree0, margin = 0.15, branch = 0.2)
text(tree0, fancy = TRUE, use.n = TRUE, all = TRUE)
```

![](Intro-to-rpart_files/figure-markdown_github/plot_rpart3-1.png)

In practice, trees are typically obtained in two steps. The first step involves growing a large tree. Then, the second step involves pruning the tree by deleting bottom nodes through a process of penalized complexity. The main reason for this pruning process is to avoid overfitting. Why? Because overly large decision trees will fit the (training) data almost perfectly, but will also be learning the unique noise associated to the data.

By default, `rpart()` grows a tree until some stopping critera are met. Namely, the tree stops growing whenever: 1) the decrease in the purity goes below a certain threshold; when 2) the number of observations in the node is less than another threshold; or when 3) the tree depth exceeds a certain value. These stopping criteria are controlled by the parameters `cp`, `minsplit`, and `maxdepth`.

### Parameters

Other parameters: `parms` and `control`, and `cp`

The argument `parms` takes a list of optional elements:

-   `split` = the splitting index (or splitting criterion):
    -   `"gini"` for the Gini index
    -   `"information"` for the entropy
-   `prior` = optional vector of prior probabilities
-   `loss` = you can also specify a matrix of `loss` components

The argument `control` takes a list with:

-   `minsplit` = minimum number of observations inside a node
-   `minbucket` = minimum number of observations inside a node
-   `cp` = complexity parameter
-   `maxdepth` = maximum depth level
-   *other parameters* see (`?rpart.control`)

The argumet `cost` is a vector of non-negative costs, one for each variable in the model. Think of costs as scaling factors. By default, all variables have cost one.

### Cost Complexity

The `rpart()` function implements a pruning method called *cost complexity* pruning. This method uses the values of the parameter `cp` that is calculated for each node of the tree. The pruning method tries to estimate the value of `cp` that ensures the best compromise between predictive accuracy and the tree size.

Given an `"rpart"` tree, it is possible to obtain a set of sub-trees of this tree and estimate their predictive performance.

The argument `cp` refers to the *complexity parameter*

-   a value of `cp = 0`, the tree is grown to its maximum depth
-   a value of `cp > 0`, attempts to grow a tree of less depth

When fitting a classfication tree (`method = "class"`), the `rpart()` uses the Gini index as the splitting criterion.

### Method `summary()`

You can also use a `summary()` method on an `"rpart"` object. This will produce a large output plenty of information:

-   The `CP` cost complexity
-   The *Variable importance*, normalized in order to have a total sum of 100
-   Summaries for each node:
    -   Predicted class, expected loss
    -   class counts
    -   The *Primary* (chosen) splits
    -   The *Surrogate* splits

``` r
# summary information
summary(tree0, digits = 3)
```

    ## Call:
    ## rpart(formula = Species ~ ., data = iris, method = "class")
    ##   n= 150 
    ## 
    ##     CP nsplit rel error xerror   xstd
    ## 1 0.50      0      1.00   1.15 0.0518
    ## 2 0.44      1      0.50   0.61 0.0602
    ## 3 0.01      2      0.06   0.09 0.0291
    ## 
    ## Variable importance
    ##  Petal.Width Petal.Length Sepal.Length  Sepal.Width 
    ##           34           31           21           14 
    ## 
    ## Node number 1: 150 observations,    complexity param=0.5
    ##   predicted class=setosa      expected loss=0.667  P(node) =1
    ##     class counts:    50    50    50
    ##    probabilities: 0.333 0.333 0.333 
    ##   left son=2 (50 obs) right son=3 (100 obs)
    ##   Primary splits:
    ##       Petal.Length < 2.45 to the left,  improve=50.0, (0 missing)
    ##       Petal.Width  < 0.8  to the left,  improve=50.0, (0 missing)
    ##       Sepal.Length < 5.45 to the left,  improve=34.2, (0 missing)
    ##       Sepal.Width  < 3.35 to the right, improve=19.0, (0 missing)
    ##   Surrogate splits:
    ##       Petal.Width  < 0.8  to the left,  agree=1.000, adj=1.00, (0 split)
    ##       Sepal.Length < 5.45 to the left,  agree=0.920, adj=0.76, (0 split)
    ##       Sepal.Width  < 3.35 to the right, agree=0.833, adj=0.50, (0 split)
    ## 
    ## Node number 2: 50 observations
    ##   predicted class=setosa      expected loss=0  P(node) =0.333
    ##     class counts:    50     0     0
    ##    probabilities: 1.000 0.000 0.000 
    ## 
    ## Node number 3: 100 observations,    complexity param=0.44
    ##   predicted class=versicolor  expected loss=0.5  P(node) =0.667
    ##     class counts:     0    50    50
    ##    probabilities: 0.000 0.500 0.500 
    ##   left son=6 (54 obs) right son=7 (46 obs)
    ##   Primary splits:
    ##       Petal.Width  < 1.75 to the left,  improve=39.00, (0 missing)
    ##       Petal.Length < 4.75 to the left,  improve=37.40, (0 missing)
    ##       Sepal.Length < 6.15 to the left,  improve=10.70, (0 missing)
    ##       Sepal.Width  < 2.45 to the left,  improve= 3.56, (0 missing)
    ##   Surrogate splits:
    ##       Petal.Length < 4.75 to the left,  agree=0.91, adj=0.804, (0 split)
    ##       Sepal.Length < 6.15 to the left,  agree=0.73, adj=0.413, (0 split)
    ##       Sepal.Width  < 2.95 to the left,  agree=0.67, adj=0.283, (0 split)
    ## 
    ## Node number 6: 54 observations
    ##   predicted class=versicolor  expected loss=0.0926  P(node) =0.36
    ##     class counts:     0    49     5
    ##    probabilities: 0.000 0.907 0.093 
    ## 
    ## Node number 7: 46 observations
    ##   predicted class=virginica   expected loss=0.0217  P(node) =0.307
    ##     class counts:     0     1    45
    ##    probabilities: 0.000 0.022 0.978

### Complexity and pruning

In addition to `summary()`, you can also use `printcp()` which allows you to get more information about the complexity of the tree. More precisely, this function displays the so-called CP table:

``` r
# CP table
printcp(tree0)
```

    ## 
    ## Classification tree:
    ## rpart(formula = Species ~ ., data = iris, method = "class")
    ## 
    ## Variables actually used in tree construction:
    ## [1] Petal.Length Petal.Width 
    ## 
    ## Root node error: 100/150 = 0.66667
    ## 
    ## n= 150 
    ## 
    ##     CP nsplit rel error xerror     xstd
    ## 1 0.50      0      1.00   1.15 0.051801
    ## 2 0.44      1      0.50   0.61 0.060161
    ## 3 0.01      2      0.06   0.09 0.029086

The CP table has five columns and as many rows as number of splits in the tree (the root node corresponds to `nsplit` = 0).

-   `CP` = complexity parameter
-   `nsplit` =
-   `rel error` = relative error
-   `xerror` = cross-validation error
-   `xstd` = cross-validation standard deviation

The error rates are relative to the root node, this is why the `rel error` of the root node has a reference value of 1.
