shinyUI(
  navbarPage('Web-based Classification Tool', header = "",
     #tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "http://bootswatch.com/united/bootstrap.css")),
     source("external/inputTab.R",local=T)$value,
     source("external/exploreTab.R",local=T)$value,
     source("external/classifyTab.R",local=T)$value
  )
)  

# There is an insisting blank row that keeps showing up below the navigation bar
# Waiting for help here: http://goo.gl/QN0cug
