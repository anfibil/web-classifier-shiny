tabPanel('Explore Data',
	sidebarLayout(
  		sidebarPanel(width=3,
			uiOutput('selectFeature1'),
			uiOutput('selectFeature2'),
        	uiOutput('selectclass')
		),
  		mainPanel(
  			column(6, align='center',
    			plotOutput('bPlot'),
    			plotOutput('scaPlot')
    		),
    		column(6, align='center',
    			plotOutput('histPlot'),
    			br(),
    			h5(strong("Summary")),
    			tags$script(type="text/css", ".span8 .well { background-color: #FFFFFF; }"),
      			verbatimTextOutput("summary")
    		)
    	)
    )
)	