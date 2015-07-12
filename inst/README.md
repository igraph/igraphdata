




# Data sets for the igraph R package

[![Linux build status](https://travis-ci.org/igraph/igraphdata.png)](https://travis-ci.org/igraph/igraphdata)
[![Windows build status](https://ci.appveyor.com/api/projects/status/6wov9hh8oprrpkhs?svg=true)](https://ci.appveyor.com/project/gaborcsardi/igraphdata)

This is a data R package, that contains network data sets,
to be used with the igraph R package.

## Installation

From CRAN:


```r
install.packages("igraphdata")
```

You can install the development version from Github, using the
[devtools package](https://github.com/hadley/devtools):


```r
devtools::install_github("igraph/igraphdata")
```

## Usage


```r
library(igraphdata)
data(package = "igraphdata")
```

```
#> Data sets in package 'igraphdata':
#> 
#> Koenigsberg           Bridges of Koenigsberg from Euler's times
#> UKfaculty             Friendship network of a UK university
#>                       faculty
#> USairports            US airport network, 2010 December
#> enron                 Enron Email Network
#> foodwebs              A collection of food webs
#> immuno                Immunoglobulin interaction network
#> karate                Zachary's karate club network
#> kite                  Krackhardt's kite
#> macaque               Visuotactile brain areas and connections
#> yeast                 Yeast protein interaction network
```

# License

CC BY-SA 4.0, plus see [LICENSE](LICENSE) for the licenses of the
individual data sets.
