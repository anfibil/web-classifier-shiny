inFile <- reactive ({
	if (is.null(input$file1))
		return(NULL)
	input$file1
})

###################
#### INPUT TAB ####
###################

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


#####################
#### EXPLORE TAB ####
#####################

output$selectFeature1 = renderUI({
      selectInput('feature1', 'Choose Feature 1 (X)', intersect(input$featuresToUse,numericFeatures()))
})

output$selectFeature2 = renderUI({
      selectInput('feature2', 'Choose Secondary Feature (Y) for Scatterplot', intersect(input$featuresToUse,numericFeatures()))
})

output$selectclass <- renderUI({
    if(!is.null(d())) selectInput('class','Select Class',factors(),selected=factors())
})

output$bPlot <- renderPlot({
	if(is.null(inFile()) || is.null(input$feature1))  return(NULL)

	boxplot(d()[,input$feature1]~d()[,input$class],data=d(),
        col=add.alpha(brewer.pal(nlevels(d()[,input$class]), "Set1"),.6),
        xlab=input$class,
        ylab=input$feature1,
        main=paste0(list(input$feature1," boxplot grouped by class (", input$class, ")"), collapse=""))
})

output$histPlot <- renderPlot({  
	if(is.null(inFile()) || is.null(input$feature1))  return(NULL)
	hist(d()[,input$feature1],
		main=paste0(list("Histogram of ",input$feature1), collapse=""),
		xlab=input$feature1,
		col='gray92')
})

output$scaPlot <- renderPlot({
	if(is.null(inFile()) || is.null(input$feature1))  return(NULL)
    cols = add.alpha(brewer.pal(nlevels(d()[,input$class]), "Set1"),.7)[1:nlevels(d()[,input$class])]
    plot(d()[,c(input$feature1,input$feature2)],
    	main = paste0(list("Scatterplot of ",input$feature1," vs ",input$feature2), collapse=""),
        col = cols[d()[,input$class]],
        pch = 20, cex = 3)
    legend("topleft", legend=c(levels(d()[,input$class])), fill=cols, bty = "n") # puts text in the legend 
})


output$summary <- renderPrint({
	dataset <- d()[,input$feature1]
	summary(dataset)
})