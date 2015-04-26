# split the data matrix for a scatterplot by series
data_scatter = function(x, y, series = NULL) {
  xy = unname(cbind(x, y))
  if (is.null(series)) return(list(list(type = 'scatter', data = xy)))
  xy = split(as.data.frame(xy), series)
  nms = names(xy)
  obj = list()
  for (i in seq_along(xy)) {
    obj[[i]] = list(name = nms[i], type = 'scatter', data = unname(as.matrix(xy[[i]])))
  }
  obj
}
