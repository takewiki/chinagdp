#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(recharts);




# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderEChart({
    
    # generate bins based on input$bins from ui.R
    totGDP <- data.table::dcast(ChinaGDP, Prov~., sum, value.var='GDP')
    ChinaGDP <- ChinaGDP[order(ChinaGDP$Year),]
    
    
    p<-echartr(ChinaGDP, Prov, GDP, Year, type="map_china") 
    p <-p  %>%  setDataRange(splitNumber=0, valueRange=range(totGDP[, 2]), 
                             color=c('red','orange','yellow','limegreen','green')) 
    p <-p %>%    setTitle("China GDP by Provice, 2012-2014")
    
    print(p)
    
    
  })
  
})


