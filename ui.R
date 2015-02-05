shinyUI(
  navbarPage(title=div(img(src="http://i.imgur.com/exTOHnM.png"), "  |   Web-based Classification Tool"), header = "", theme = shinytheme("spacelab"),
             source("external/inputTab.R",local=T)$value,
             source("external/exploreTab.R",local=T)$value,
             source("external/classifyTab.R",local=T)$value
  )
)