library(shiny)

dat <- read.csv('../../data/nba-teams-2017.csv', header = TRUE)

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Correlation
  output$correlation <- renderPrint({ 
    cor(dat[,input$xvar], dat[,input$yvar])
  })
    
  output$histogram <- renderPlot({
    # generate bins based on input$bins from ui.R
    x    <- na.omit(dat[ ,input$xvar])
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    histogram <- hist(x, breaks = bins, 
                      #probability = input$density,
                      col = 'gray80', border = 'white', las = 1, 
                      axes = FALSE, xlab = "",
                      main = paste("Histogram of", input$xvar))
    axis(side = 2, las = 1)
    axis(side = 1, at = bins, labels = round(bins, 2))
    
  })
  
  # Fill in the spot we created for a plot
  output$scatterplot <- renderPlot({
    
    # Render a barplot
    plot(dat[,input$xvar], dat[,input$yvar], 
         main = 'scatter diagram', type = 'n', axes = FALSE,
         xlab = input$xvar, ylab = input$yvar)
    axis(side = 1)
    axis(side = 2, las = 1)
    points(dat[,input$xvar], dat[,input$yvar],
           pch = 21, col = 'white', bg = '#4878DFaa',
           lwd = 2, cex = input$size_point)
    text(dat[,input$xvar], dat[,input$yvar], label = dat$team,
         xpd = TRUE, cex = input$size_label)
  })
})