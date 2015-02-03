shinyUI(fluidPage(
  tags$head(tags$link(rel = "stylesheet", type = "text/css", href = "http://bootswatch.com/united/bootstrap.css")),
  navbarPage('Web-based Classification Tool',
    source("external/inputTab.R",local=T)$value,
    source("external/exploreTab.R",local=T)$value
  )
))        