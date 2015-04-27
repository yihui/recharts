#' Create an ECharts widget
#'
#' Create an HTML widget for ECharts that can be rendered in the R console, R
#' Markdown documents, or Shiny apps. You can add more components to this widget
#' and customize options later. \code{eChart()} is an alias of \code{echart()}.
#' @param data a data object (usually a data frame or a list)
#' @rdname eChart
#' @export
#' @examples library(recharts)
#' echart(iris, ~ Sepal.Length, ~ Sepal.Width)
#' echart(iris, ~ Sepal.Length, ~ Sepal.Width, series = ~ Species)
echart = function(data, ...) {
  UseMethod('echart')
}

#' @export
#' @rdname eChart
echart.list = function(data, width = NULL, height = NULL, ...) {
  htmlwidgets::createWidget(
    'echarts', data, width = width, height = height, package = 'recharts'
  )
}

#' @param x the x variable
#' @param y the y variable
#' @export
#' @rdname eChart
echart.data.frame = function(
  data = NULL, x = NULL, y = NULL, series = NULL, type = 'auto',
  width = NULL, height = NULL, ...
) {

  xlab = autoArgLabel(x, deparse(substitute(x)))
  ylab = autoArgLabel(y, deparse(substitute(y)))

  x = evalFormula(x, data)
  y = evalFormula(y, data)
  if (type == 'auto') type = determineType(x, y)
  series = evalFormula(series, data)
  data_fun = getFromNamespace(paste0('data_', type), 'recharts')

  ###start axis from 0
  min_xaxis = ifelse( min(x) >0, 0, min(x))
  min_yaxis = ifelse( min(y) >0, 0, min(y))

  params = structure(list(
    series = data_fun(x, y, series),
    xAxis = list(

    ), yAxis = list(

    )
  ), meta = list(
    x = x, y = y
  ))
  if (!is.null(series)) params$legend = list(data = unique(series))

  chart = htmlwidgets::createWidget(
    'echarts', params, width = width, height = height, package = 'recharts',
    dependencies = getDependency(NULL)
  )
  ###start both axes from 0.
  chart %>% eAxis('x', name = xlab,  min = min_yaxis) %>% eAxis('y', name = ylab,  min = min_xaxis)
}

#' @export
#' @rdname eChart
echart.default = echart.data.frame

#' @export
#' @rdname eChart
eChart = echart
# from the planet of "Duo1 Qiao1 Yi1 Ge4 Jian4 Hui4 Si3" (will die if having to
# press one more key, i.e. Shift in this case)

determineType = function(x, y) {
  if (is.numeric(x) && is.numeric(y)) return('scatter')
  message('The structure of x:')
  str(x)
  message('The structure of y:')
  str(y)
  stop('Unable to determine the chart type from x and y automatically')
}

# not usable yet; see https://github.com/ecomfe/echarts/issues/1065
getDependency = function(type) {
  if (is.null(type)) return()
  htmltools::htmlDependency(
    'echarts-module', EChartsVersion,
    src = system.file('htmlwidgets/lib/echarts/chart', package = 'recharts'),
    script = sprintf('%s.js', type)
  )
}

getMeta = function(chart) {
  attr(chart$x, 'meta', exact = TRUE)
}
