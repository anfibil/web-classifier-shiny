tabPanel('Explore Data', icon = icon("bar-chart"),
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
    			verbatimTextOutput("summary")
    		)
    	)
    )
)	

