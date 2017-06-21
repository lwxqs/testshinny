library(shiny)
library(DT)
shinyUI(
  pageWithSidebar(
    headerPanel("我的测试shiny"),
    sidebarPanel(
      selectInput("dataset", "选择数据表:", 
                  list("外呼监控——拨出时间" = "a", 
                       "外呼监控——到期时间" = "b" 
                      ))
    ),
    
    mainPanel(
      
      
      DT::dataTableOutput("table"),
      h3("统计指标"), 
      verbatimTextOutput("summary")
      
    )
  )
)
