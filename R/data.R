# split the data matrix for a scatterplot by series
data_scatter = function(x, y, series = NULL, type = 'scatter') {
  xy = unname(cbind(x, y))
  if (is.null(series)) return(list(list(type = type, data = xy)))
  xy = split(as.data.frame(xy), series)
  nms = names(xy)
  obj = list()
  for (i in seq_along(xy)) {
    obj[[i]] = list(name = nms[i], type = type, data = unname(as.matrix(xy[[i]])))
  }
  obj
}

data_bar = function(x, y, series = NULL, type = 'bar') {

  # plot the frequencies of x when y is not provided
  if (is.null(y)) {

    if (is.null(series)) {
      y = table(x)
      return(list(list(type = type, data = unname(c(y)))))
    }

    y = table(x, series)
    nms = colnames(y)
    obj = list()
    for (i in seq_len(ncol(y))) {
      obj[[i]] = list(name = nms[i], type = type, data = unname(y[, i]))
    }
    return(obj)

  }

  # when y is provided, use y as the height of bars
  if (is.null(series)) {
    return(list(list(type = type, data = y)))
  }

  xy = tapply(y, list(x, series), function(z) {
    if (length(z) == 1) return(z)
    stop('y must only have one value corresponding to each combination of x and series')
  })
  nms = colnames(xy)
  obj = list()
  for (i in seq_len(ncol(xy))) {
    obj[[i]] = list(name = nms[i], type = type, data = unname(xy[, i]))
  }
  obj

}

data_line = function(x, y, series = NULL) {
  if (is.numeric(x)) {
    return(data_scatter(x, y, series, type = 'line'))
  }
  if (is.null(series)) {
    return(list(list(type = 'line', data = y)))
  }
  data_bar(x, y, series, type = 'line')
}
