% Please edit documentation in R/options.R
\name{eAxis}
\alias{eAxis}
\alias{eXAxis}
\alias{eYAxis}
\title{Create an axis for a chart}
\usage{
eAxis(chart, which = c("x", "y"), type = c("value", "category", "time"), show = TRUE, 
    position = c("bottom", "top", "left", "right"), name = "", nameLocation = c("end", 
        "start"), nameTextStyle = emptyList(), boundaryGap = c(0, 0), min = NULL, 
    max = NULL, scale = TRUE, splitNumber = NULL, axisLine = list(show = TRUE, 
        onZero = FALSE), axisTick = list(show = FALSE), axisLabel = list(show = TRUE), 
    splitLine = list(show = TRUE), splitArea = list(show = FALSE), data = list())

eXAxis(chart, ...)

eYAxis(chart, ...)
}
\description{
Add an axis to a chart.
}
\details{
This function modified a few default options for the axis component in
ECharts: 1) \code{scale = TRUE} (was \code{FALSE} by default in ECharts); 2)
\code{axisLine$onZero = FALSE} (was \code{TRUE} in ECharts).
}
