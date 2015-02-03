shinyServer(function(input, output) {

  source("external/reactives.R", local=T)
  
  output$featuresToUse <- renderUI({
    selectInput('featuresToUse',"Select the features you wish to use",featureNames(),multiple=TRUE,selected=featureNames())
  })
    
  output$table <- renderDataTable({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)

    data <- d()[,c(input$featuresToUse)]
    data
  },options=list(searching = FALSE,pageLength = 10))

})
