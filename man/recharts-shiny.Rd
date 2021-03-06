% Please edit documentation in R/shiny.R
\name{eChartOutput}
\alias{eChartOutput}
\alias{renderEChart}
\title{Wrapper functions for Shiny}
\usage{
eChartOutput(outputId, width = "100\%", height = "400px")

renderEChart(expr, env = parent.frame(), quoted = FALSE)
}
\arguments{
\item{outputId}{the output id to be used in the \code{output} object on the
server side}

\item{width}{the width of the chart}

\item{height}{the height of the chart}

\item{expr}{an R expression to return an EChart widget}

\item{env}{The environment in which to evaluate \code{expr}.}

\item{quoted}{Is \code{expr} a quoted expression (with \code{quote()})? This
  is useful if you want to save an expression in a variable.}
}
\description{
Use \code{eChartOutput()} to create a container for a ECharts widget in the
UI, and \code{renderEChart()} to render the widget on the server side.
}
\examples{
\donttest{library(recharts)
library(shiny)
app = shinyApp(
  ui = fluidPage(eChartOutput('myChart')),
  server = function(input, output) {
    chart = echart(x = rnorm(100), y = rnorm(100))
    output$myChart = renderEChart(chart)
  }
)

if (interactive()) print(app)}
}
