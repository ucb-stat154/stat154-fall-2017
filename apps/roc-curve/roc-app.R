
library(shiny)
library(caret)
library(ggplot2)
library(MASS)
library(pROC)


# simulated data with function quadBoundaryFunc() which
# creates a class boundary that is a function of both predictors. 
dat <- read.csv('train-data.csv')

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("ROC Curve"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("threshold",
                     "Class-1 Probability Threshold",
                     min = 0,
                     max = 1,
                     value = 0.5),
         hr(),
         h5("Confussion Matrix"),
         tableOutput("confussion"),
         h5("Error Rate"),
         verbatimTextOutput("error_rate"),
         h5("Sensitivity"),
         verbatimTextOutput("sensitivity"),
         h5("Specificity"),
         verbatimTextOutput("specificity")
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("rocplot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   pred_class <- reactive({
     lda_pred_train_aux <- dat$ldaprob > input$threshold
     factor(ifelse(lda_pred_train_aux, 'Class1', 'Class2'))
   })
   tbl <- reactive({
     tbl <- table(obs = dat$class, pred = pred_class())
   })
   
   # sensitivity for train LDA
   sensi <- reactive({
     sensitivity(data = pred_class(),
                        reference = dat$class,
                        positive = "Class1")
   })
   
   # specificity for train LDA
   speci <- reactive({
     specificity(data = pred_class(),
                       reference = dat$class,
                       negative = "Class2")
   
   })
   
   output$confussion <- renderTable({
     # confusion matrix for training data
     data.frame(
       Obs = c("Class1", "Class2"),
       Pred1 = tbl()[,1],
       Pred2 = tbl()[,2]
     )
   })

   output$error_rate <- renderText({
     1 - sum(diag(tbl()) / sum(tbl()))
   })
   
   output$sensitivity <- renderText({
     sensi()
   })
   
   output$specificity <- renderText({
     speci()
   })
   
   output$rocplot <- renderPlot({
     # training data ROC Curve
     lda_train_roc <- roc(
       response = dat$class,
       predictor = dat$ldaprob,
       levels = rev(levels(dat$class))
     )
     
     # Roc curve
     plot(lda_train_roc, legacy.axes = TRUE, las = 1, lwd = 3, col = 'gray50')
     points(speci(), sensi(), pch = 19, col = "tomato", cex = 2)
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

