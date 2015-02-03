navbarMenu("Classify",
    tabPanel("Classify new data",
      source("./external/classifyTab1.R",local=T)$value
    ),
    tabPanel("Estimate with cross-validation",
      source("./external/classifyTab2.R",local=T)$value
    )
)