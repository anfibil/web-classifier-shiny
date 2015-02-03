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