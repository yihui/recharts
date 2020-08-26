# recharts

[![Build Status](https://travis-ci.org/yihui/recharts.svg)](https://travis-ci.org/yihui/recharts)

This is a prototype of porting [Apache ECharts (incubating)](https://echarts.apache.org/) into R using **htmlwidgets**. I only spent a few days on it last year, and I hope more R users can contribute to it. To install this package (please use [R >= 3.2.0](http://cran.rstudio.com/)):

```r
install.packages(
  'recharts',
  repos = c('http://yihui.name/xran', 'http://cran.rstudio.com')
)
```

Some "hello world" examples:

```r
library(recharts)
echart(iris, ~Sepal.Length, ~Sepal.Width)
echart(iris, ~Sepal.Length, ~Sepal.Width, series = ~Species)
```

See https://github.com/taiyun/recharts for a similar project that we worked on before. Without the blessings of **htmlwidgets**, it is much more difficult to maintain that project. I hope this one can grow into a truly nice and exciting package.
See the package website <http://yihui.name/recharts> for more information if you want to contribute.
