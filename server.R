library(shiny)
library(DT)
dialdata<-read.csv("C:/Users/dialdata.csv",header=T,sep=",")
duedata<-read.csv("C:/Users/duedata.csv",header=T,sep=",")
dialdata<-as.data.frame(dialdata)
duedata<-as.data.frame(duedata)
shinyServer(function(input, output) {
  datasetInput <- reactive({
    switch(input$dataset,
          "a" = dialdata,
          "b" = duedata)
  })
  output$summary <- renderPrint({
    dataset <- datasetInput()
    summary(dataset)
  })
  output$table <- DT::renderDataTable(DT::datatable({
    datasetInput()
  }, rownames = FALSE,class ='cell-border stripe' ))

})
