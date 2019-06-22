#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(recharts);



# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("2012-2014年GDP演示数据"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      '请选择年份或拖动滚动条'
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      eChartOutput("distPlot",height="500px")
    )
  )
))


