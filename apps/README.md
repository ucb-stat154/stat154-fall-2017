# Shiny Apps

This is a collection of Shiny apps to be used mainly during lecture.


## Running the apps

The easiest way to run an app is with the `runGitHub()` function from the `"shiny"` package. Please make sure you have installed the package `"shiny"`. In case of doubt, run:

```R
install.packages("shiny")
```


For instance, to run the app contained in the [nba-teams-2017](/nba-teams-2017) folder, run the following code in R:

```R
library(shiny)

# Run an app from a subdirectory in the repo
runGitHub("stat154-fall-2017", "ucb-stat154", subdir = "apps/nba-teams-2017")
```
