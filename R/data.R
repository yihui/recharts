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

data_bar = function(x, y, series = NULL) {
  ### if no series passed... go with only one series.
  if (is.null(series)) {
    warning("No series specified for bar plot.")
    return(list(list(name = '', type = 'bar', data = y)))
  }
  #otherwise, go with series.
  xy = y ### why no names?
  xy = split(as.data.frame(xy), series)
  nms = names(xy)
  obj = list()
  for (i in seq_along(xy)) {
    obj[[i]] = list(name = nms[i], type = 'bar', data = unname(unlist(xy[[i]])))
  }
  obj
}

data_line = function(x, y, series = NULL) {
  ### if no series passed... go with only one series.
  if (is.null(series)) {
    warning("No series specified for bar plot.")
    return(list(list(name = '', type = 'line', data = y)))
  }
  #otherwise, go with series.
  xy = y ### why no names?
  xy = split(as.data.frame(xy), series)
  nms = names(xy)
  obj = list()
  for (i in seq_along(xy)) {
    obj[[i]] = list(name = nms[i], type = 'line', data = unname(unlist(xy[[i]])))
  }
  obj
}
