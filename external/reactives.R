###################
#### INPUT TAB ####
###################

inFile <- reactive ({
	if (is.null(input$file1))
		return(NULL)
	input$file1
})

d <- reactive({
	if(is.null(inFile()))  return(NULL)
  
	read.csv(inFile()$datapath, header = input$header, sep = input$sep, quote = input$quote, na.strings=input$nastrings)
})

featureNames <- reactive({
	if(!is.null(d())) f <- names(d()) else f <- NULL#[which(!(names(d()) %in% input$class))] else f <- NULL
	f
})

factors <- reactive({
  if(!is.null(d())) f <- names(d())[sapply(d(),is.factor)] else f <- NULL
  f
})

numericFeatures <- reactive({
	if(!is.null(d())) f <- names(d())[sapply(d(),is.numeric)] else f <- NULL
	f
})


###############################
#### CLASSIFY NEW DATA TAB ####
###############################

inFile2 <- reactive ({
	if (is.null(input$file2))
		return(NULL)
	input$file2
})

d2 <- reactive({
	if(is.null(inFile2()))  return(NULL)
  	data = read.csv(inFile2()$datapath, header = input$header, sep = input$sep, quote = input$quote, na.strings=input$nastrings)
  	data <- data[,c(input$featuresToUse)]
  	data
})

output$table2 <- renderDataTable({
  inFile <- input$file2
  
  if (is.null(inFile))
    return(NULL)

  d2()
},options=list(searching = FALSE,pageLength = 10))