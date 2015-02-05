sidebarLayout(
    sidebarPanel(width=3, align='center',
		wellPanel(align='left',
			fileInput('file2', h4('Choose test file to upload'),
			accept = c(
                      'text/csv',
                      'text/comma-separated-values',
                      'text/tab-separated-values',
                      'text/plain',
                      '.csv',
                      '.tsv'
			))
        ),
        wellPanel(align='left',
	        selectizeInput('op1', 'Select the classifier you wish to use', choices = names(clfs), multiple = F),
          actionButton('classifyButton', 'Evaluate Model')
      	)
	),
	mainPanel(
		verbatimTextOutput("clfchoice")
    )
)
