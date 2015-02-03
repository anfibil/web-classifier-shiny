tabPanel('Input and Pre-process',  
  sidebarLayout(
    sidebarPanel(width=3, align='center',
      wellPanel(align='left',
        fileInput('file1', h4('Choose file to upload'),
          accept = c(
                      'text/csv',
                      'text/comma-separated-values',
                      'text/tab-separated-values',
                      'text/plain',
                      '.csv',
                      '.tsv'
                    )
        )
      ),
      
      wellPanel(align='left',
        h4("Input File Format"),
        checkboxInput('header', 'Includes Header', TRUE),
        radioButtons('sep', h6('Separator:'),c(Comma=',',Semicolon=';', Tab='\t'),','),
        radioButtons('quote', h6('Quote:'), c(None='', 'Double Quote'='"', 'Single Quote'="'"), '"'),
        textInput("nastrings", label = h6("NA representation:"), value = "")
      ),
  
      wellPanel(align='left',
        h4("Variable Selection"),
        uiOutput("featuresToUse",inline=TRUE)
      ),

      #actionButton("processData", "Process Full Dataset", icon=icon('cogs')),

      hr(),
      p('If you want a sample .csv or .tsv file to upload,',
        'you can first download the sample',
        a(href = 'test.csv', 'test.csv'), 'or',
        a(href = 'test.tsv', 'test.tsv'),
        'files, and then try uploading them.'
      )
    ),
  
    mainPanel(
      h4('Preview of Dataset:', align = "center"),
      busyIndicator("Please Wait",wait = 1000),
      dataTableOutput(outputId="table")
    )
  )
)