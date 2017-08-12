
library(shiny)


dat <- read.csv('../../data/nba-teams-2017.csv', header = TRUE, nrows = 3)

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("NBA Teams 2017"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        selectInput("xvar", "X-axis variable", 
                    choices = colnames(dat[,-1]), selected = 'wins'),
        sliderInput("bins",
                    "Number of bins:",
                    min = 1,
                    max = 50,
                    value = 10),
        selectInput("yvar", "Y-axis variable", 
                    choices = colnames(dat[,-1]), selected = 'losses'),
        sliderInput("size_point", 
                    label = "Size of labels",
                    min = 0, max = 4, value = 2, step = 0.1),
        sliderInput("size_label", 
                    label = "Size of labels",
                    min = 0, max = 3, value = 0.8, step = 0.1),
        hr(),
        helpText('Correlation:'),
        verbatimTextOutput("correlation")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel("Histograms", plotOutput("histogram")),
                    tabPanel("Scatterplots", plotOutput("scatterplot"))
        )
      )
      
    )
  )
)